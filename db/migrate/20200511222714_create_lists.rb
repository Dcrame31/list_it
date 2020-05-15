class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.date :created_on
      t.date :update_on
    end
  end
end
