module V1
  class ConversationsController < ApplicationController

    # GET /conversations
    def index
      conversations_from_friends = Conversation.find_by!(friend: current_user.phone) 
      @conversations = current_user.conversations.all
      @conversations.merge(conversations_from_friends)
      json_response(@conversations)
    end

    # POST /conversations
    def create
      @conversation = Conversations.create!(conversation_params)
      json_response(@conversation, :created)
    end

    # GET /conversations/:id
    def show
      @conversation = Conversation.find(params[:id])
      json_response(@conversation)
    end

    private

    def conversation_params
      # whitelist params
      params.permit(:friend)
    end
  end
end
