class Income < ApplicationRecord
  belongs_to :budget
  
  validates :budget_id, :date, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than: 0 } 
end
