require 'swagger_helper'

RSpec.describe 'Generate API', type: :request do
  let(:api_key) { 'fake_key' }

  before do
    allow(ActiveSupport::Deprecation).to receive(:warn)
    allow(GenerateMapService).to receive(:new).and_call_original
    allow_any_instance_of(GenerateMapService).to receive(:generate).and_return(Magick::Image.new(0, 0)) # Silence deprecation output from specs
  end

  path '/generate' do
    get 'Generate a new map' do
      tags 'World'
      description 'Generate a new map based on user input'
      operationId 'generateMap'
      produces 'application/json'

      response '200', 'map generated' do
        schema type: :object,
               properties: {
                 data: { type: :string }
               }

        run_test!(swagger_strict_schema_validation: true)
      end
    end
  end
end
