class AddLastMessageToConversations < ActiveRecord::Migration[5.2]
    def change
      add_column :conversations, :last_message, :string, default: ""
    end
  end