class AddUnreadToConversations < ActiveRecord::Migration[5.2]
    def change
      add_column :conversations, :unread, :integer, default: 0
    end
  end