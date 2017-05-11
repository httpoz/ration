class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|

      t.string :name
      t.date :date
      t.decimal :amount
      t.references :budget, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
