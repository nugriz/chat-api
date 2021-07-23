class MassagesController < ApplicationController
  before_action :set_conversation

    # GET /conversations/:conversation_id/massages
  def index
    json_response(@conversation.massages)
  end

    # POST /conversations/:conversation_id/massages
  def create
    @conversation.massages.create!(massage_params)
    json_response(@conversation, :created)
  end

  private

  def massage_params
    params.permit(:content).merge(sender: current_user.id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end

