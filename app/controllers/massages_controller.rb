class MassagesController < ApplicationController
  before_action :set_conversation

    # GET /conversations/:conversation_id/massages
  def index
    for massage in @conversation.massages
      if current_user.id != massage.sender 
        massage.update_attribute(:read,true)
      end
    end
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

