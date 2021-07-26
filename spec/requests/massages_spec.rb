# spec/requests/massages_spec.rb
require 'rails_helper'

RSpec.describe 'Massages API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:conversation) { create(:conversation, user: user) }
  let!(:massages) { create_list(:massage, 20, conversation_id: conversation.id) }
  let(:conversation_id) { conversation.id }
  let(:id) { massages.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /conversations/:conversation_id/massages
  describe 'GET /conversations/:conversation_id/massages' do
    before { get "/conversations/#{conversation_id}/massages", params: {}, headers: headers }

    context 'when conversation exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all conversation massages' do
        expect(json.size).to eq(20)
      end
    end

    context 'when conversation does not exist' do
      let(:conversation_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Conversation with 'id'=0\"}")
      end
    end
  end

  # Test suite for POST /conversations/:conversation_id/massages
  describe 'POST /conversations/:conversation_id/massages' do
    let(:valid_attributes) { { content: "halooooooooooooo" }.to_json }

    context 'when request attributes are valid' do
      before { post "/conversations/#{conversation_id}/massages", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/conversations/#{conversation_id}/massages", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match("{\"message\":\"Validation failed: Content can't be blank\"}")
      end
    end
  end
end