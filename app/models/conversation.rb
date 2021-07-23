class Conversation < ApplicationRecord
  belongs_to :user

  has_many :massages 

  attr_accessor :last_message
  def initialize(last_message = '')
    @last_message = ''
  end
end
