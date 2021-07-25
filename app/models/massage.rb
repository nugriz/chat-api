class Massage < ApplicationRecord
  belongs_to :conversation

  validates_presence_of :sender, :content
end
