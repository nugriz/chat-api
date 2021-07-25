class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :friend, :user_id, :last_message, :unread
  has_many :massages
end
