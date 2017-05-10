class Expense < ApplicationRecord
  
  belongs_to :budget
  
  validates :name, presence: true
  validates :amount, numericality: true
  validates :date, presence: true
  validates :category, presence: true
  
  # :category might be it's own table
  
end
