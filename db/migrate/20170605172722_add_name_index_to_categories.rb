class AddNameIndexToCategories < ActiveRecord::Migration[5.1]
  def change
    add_index :categories, :name
  end
end
