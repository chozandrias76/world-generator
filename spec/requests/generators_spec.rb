require 'swagger_helper'

RSpec.describe 'Generate API', type: :request do
  let(:api_key) { 'fake_key' }

  before do
    allow(ActiveSupport::Deprecation).to receive(:warn) # Silence deprecation output from specs
  end

  path '/generate' do
    post 'Generate a new map' do
      tags 'Generate'
      description 'Generate a new map based on user input'
      operationId 'generateMap'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :seed, in: :body, schema: { type: :string }

      let(:seed) { 'your_seed_string_here' } # Replace with the seed string you want to test

      response '200', 'map generated' do
        schema type: :string

        run_test! do |response|
          # Call your service here and compare the response with the expected result
          service_response = MyService.call(input_data)
          expect(response.body).to eq({ result: service_response }.to_json)
        end
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
