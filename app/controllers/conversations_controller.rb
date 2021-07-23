class ConversationsController < ApplicationController
    # GET /conversations
  def index
    conversations_from_friends = Conversation.where(friend: current_user.phone) 
    @conversations = current_user.conversations.all
    @conversations =  @conversations + conversations_from_friends
    for conversation in @conversations
      if conversation.massages.last.present?
        conversation.last_message = conversation.massages.last.content
      end
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
