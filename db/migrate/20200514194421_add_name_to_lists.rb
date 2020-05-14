class AddNameToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :name, :string
    add_column :lists, :created_at, :datetime, null: false
    add_column :lists, :updated_at, :datetime, null: false
  end
end
