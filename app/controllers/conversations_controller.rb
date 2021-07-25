class ConversationsController < ApplicationController
  def initialize(last_message = '')
    @last_message = ''
  end
    # GET /conversations
  def index
    conversations_from_friends = Conversation.where(friend: current_user.phone) 
    @conversations = current_user.conversations.all
    @conversations =  @conversations + conversations_from_friends
    for conversation in @conversations
      conversation.last_and_unread_messages(current_user)
    end  
    json_response(@conversations)
  end

    # POST /conversations
  def create
    @conversation = current_user.conversations.create!(conversation_params)
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
