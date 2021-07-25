class AddReadToMassages < ActiveRecord::Migration[5.2]
  def change
    add_column :massages, :read, :boolean, default: false
  end
end
