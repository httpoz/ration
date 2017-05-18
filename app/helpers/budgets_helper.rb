module BudgetsHelper
 
  def calculate_total(category)
    sum = 0
    @budget.expenses.each do |expense|
      sum += expense.amount if category == expense.category
    end
    sum
  end
  
end
