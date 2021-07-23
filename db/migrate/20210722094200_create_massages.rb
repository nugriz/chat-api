class CreateMassages < ActiveRecord::Migration[5.2]
  def change
    create_table :massages do |t|
      t.integer :sender
      t.string :content
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
