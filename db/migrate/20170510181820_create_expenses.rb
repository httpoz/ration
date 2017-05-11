class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      
      t.string :name
      t.string :category
      t.date :date
      t.decimal :amount
      t.integer :budget_id
      
      t.timestamps
    end
  end
end
