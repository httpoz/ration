class Expense < ApplicationRecord
  
  belongs_to :budget
  belongs_to :category

  attr_accessor :end_date, :frequency
  
  validates :name, presence: true
  validates :amount, numericality: true
  validates :date, presence: true
  validates :category, presence: true

  # Returns all expenses form a given year
  def self.from_year(year)
    Expense.where(date: Date.new(year,1,1)..Date.new(year,12,31) )
  end

  # Order expenses by attribute passed as URL parameters
  def self.order_by(attribute, direction = :asc)

    condition = "#{attribute} #{direction.upcase}"

    begin
      # Uses scope on expenses
      Expense.order(condition)
    rescue Exception
      # Returns an unsorted collection if passed invalid attributes
      Expense.all
    end

  end
  
  def set_schedule
    # Uses IceCube to create a schedule object 
    schedule = IceCube::Schedule.new(self.date)
    
    # Returns monthly or bi monthly until given end_date
    if frequency == "1"
      schedule.add_recurrence_rule IceCube::Rule.monthly.until(end_date)
    elsif frequency == "2"
      schedule.add_recurrence_rule IceCube::Rule.monthly(2).until(end_date)
    end
    schedule
  end
  
end
