class Expense < ApplicationRecord
  
  belongs_to :budget
  belongs_to :category
  
  validates :name, presence: true
  validates :amount, numericality: true
  validates :date, presence: true
  validates :category, presence: true
  
  # Orders expenses by most recent first
  scope :by_date, -> { order(date: :desc) } 
  scope :by_category, -> { order(:category_id) }
  
  # Returns all expenses form a given year
  def self.from_year(year)
    Expense.where(date: Date.new(year,1,1)..Date.new(year,12,31) )
  end
  
end
