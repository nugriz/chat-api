class Conversation < ApplicationRecord
  belongs_to :user

  has_many :massages 
end
