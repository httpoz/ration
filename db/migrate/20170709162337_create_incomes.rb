class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.decimal :amount
      t.string :name
      t.boolean :monthly
      t.date :date
      t.references :budget, foregin_key: true
    
      t.timestamps
    end
  end
end
