module BudgetsHelper
 
  def calculate_total(category)
    sum = 0
    @budget.expenses.each do |expense|
      sum += expense.amount if category == expense.category
    end
    sum
  end
  
  def calculate_monthly(category, month_number)
    sum = 0
    @expenses.each do |expense|
      # Totals all the expenses in the given category for the given month
      if expense.category.name == category && expense.date.month == month_number
        sum += expense.amount
      end
    end
    sum if sum != 0
  end
  
end
