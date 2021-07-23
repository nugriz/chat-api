class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :friend, :user_id, :last_message
  has_many :massages
end
