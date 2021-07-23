module V1
  class MessagesController < ApplicationController
    before_action :set_conversation
    before_action :set_conversation_message, only: [:show, :update, :destroy]

    # GET /conversations/:conversation_id/messages
    def index
      json_response(@conversation.messages)
    end

    # POST /conversations/:conversation_id/messages
    def create
      @conversation.messages.create!(message_params)
      json_response(@conversation, :created)
    end

    private

    def message_params
      params.permit(:content).merge(sender: current_user.id)
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
  end
end
