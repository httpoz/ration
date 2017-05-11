class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      
      t.string :name
      t.integer :user_id
      
      t.timestamps
    end
  end
end
