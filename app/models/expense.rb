class Expense < ApplicationRecord
  
  belongs_to :budget
  belongs_to :category
  
  validates :name, presence: true
  validates :amount, numericality: true
  validates :date, presence: true
  validates :category, presence: true
  
  # Scopes to order expenses by its different attributes
  scope :by_date, -> { order(date: :desc) } 
  scope :by_category, -> { order(:category_id) }
  scope :by_amount, -> { order(:amount) }
  scope :by_name, -> { order(:name) }
  
  # Returns all expenses form a given year
  def self.from_year(year)
    Expense.where(date: Date.new(year,1,1)..Date.new(year,12,31) )
  end
  
  # # Chooses scope to sort by based on incoming params
  def self.order_by(attribute)
    
    method = "by_#{attribute}"
    # Uses scope on expenses
    begin
      Expense.send(method)
    rescue Exception
      # Returns an unsorted collection when passed custom attributes
      Expense.all
    end
    
  end
  
end
