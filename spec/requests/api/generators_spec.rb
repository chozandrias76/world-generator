require 'swagger_helper'

RSpec.describe 'Generate API', type: :request do
  let(:api_key) { 'fake_key' }

  before do
    allow(ActiveSupport::Deprecation).to receive(:warn) # Silence deprecation output from specs
  end

  path '/generate' do
    get 'Generate a new map' do
      tags 'World'
      description 'Generate a new map based on user input'
      operationId 'generateMap'
      produces 'application/json'

      response '200', 'map generated' do
        schema type: :string

        run_test!
      end

      response '422', 'invalid request' do
        let(:seed) { '' } # Invalid seed string to test for 422 response

        run_test!

        # Example to show custom specification description
        run_test!("returns a 422 response - with error for missing seed") do |response|
          expect(response.body).to include("can't be blank")
        end
      end
    end
  end
end
