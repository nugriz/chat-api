class Conversation < ApplicationRecord
  belongs_to :user

  has_many :massages, dependent: :destroy

  validates_presence_of :friend

  
  def initialize(last_message = '')
    @last_message = ''
  end

  def last_and_unread_messages(current_user)
    unread = 0
    if massages.last.present?
      last_message = massages.last.content
      for massage in massages
        if current_user.id != massage.sender 
          if massage.read == false
            unread += 1
          end
        end
      end
    end
    update_attribute(:unread,unread)
  end

  private

  attr_accessor :last_message

end
