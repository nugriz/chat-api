# spec/requests/conversations_spec.rb
require 'rails_helper'

RSpec.describe 'Conversations API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:conversations) { create_list(:conversation, 10, user: user)}#, user: user.id) }
  let(:conversation_id) { conversations.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /conversations
  describe 'GET /conversations' do
    # make HTTP get request before each example
    before { get '/conversations', params: {}, headers: headers }

    it 'returns conversations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /conversations/:id
  describe 'GET /conversations/:id' do
    before { get "/conversations/#{conversation_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the conversation' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(conversation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:conversation_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Conversation with 'id'=100\"}")
      end
    end
  end

  # Test suite for POST /conversations
  describe 'POST /conversations' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      { friend: '08', user: user}.to_json
    end #{ { friend: '08', user: user} }, created_by: '1' } }

    context 'when the request is valid' do
      before { post '/conversations', params: valid_attributes, headers: headers }

      it 'creates a conversation' do
        expect(json['friend']).to eq('08')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { friend: nil }.to_json }
      before { post '/conversations', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Friend can't be blank\"}")
      end
    end
  end
end