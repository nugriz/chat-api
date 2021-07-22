class ConversationsController < ApplicationController
    before_action :set_conversation, only: [:show, :update, :destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all
    json_response(@conversations)
  end

  # POST /conversations
  def create
    @conversation = Conversation.create!(conversation_params)
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
