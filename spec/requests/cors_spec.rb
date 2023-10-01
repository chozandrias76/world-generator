require 'swagger_helper'

RSpec.describe 'CORS Headers', type: :request do
  describe 'CORS Preflight Request' do
    before do
      # Send a CORS preflight request (OPTIONS) to the desired endpoint
      options '/generate', headers: {
        'Origin' => 'http://localhost', # Replace with your allowed origin
        'Access-Control-Request-Method' => 'POST',
        'Access-Control-Request-Headers' => 'Content-Type, Authorization' # Replace with required headers
      }
    end

    it 'returns the correct CORS headers' do
      expect(response).to have_http_status(:ok) # Ensure it's a successful preflight request
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Allow-Methods']).to include('POST')
      expect(response.headers['Access-Control-Allow-Headers']).to eq('Content-Type, Authorization') # Replace with allowed headers
      expect(response.headers['Access-Control-Max-Age']).to eq('7200') # Optional: Replace with max age
    end
  end

end
