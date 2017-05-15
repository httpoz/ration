class Expense < ApplicationRecord
  
  belongs_to :budget
  belongs_to :category
  
  validates :name, presence: true
  validates :amount, numericality: true
  validates :date, presence: true
  validates :category, presence: true
  
  
end
