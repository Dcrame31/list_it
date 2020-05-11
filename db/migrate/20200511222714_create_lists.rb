class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :content
      t.integer :user_id
    end
  end
end
