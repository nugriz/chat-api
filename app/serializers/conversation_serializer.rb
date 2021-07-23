class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :friend, :user_id
  has_many :messages
end
