class CreateListCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :list_categories do |t|
      t.integer :list_id
      t.integer :category_id
    end
  end
end
