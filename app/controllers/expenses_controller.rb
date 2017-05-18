class ExpensesController < ApplicationController
  
  def new
    @expense = Expense.new
  end
  
  def create
    @budget = Budget.find(params[:budget_id])
    @expense = @budget.expenses.build(expense_parameters) 
    
    # Creates a new category from the expense form and assigns it to variable
    @category = Category.create(name: params[:category_name])
    @expense.category_id = @category.id
    
    if @expense.save 
      redirect_to @budget
      flash[:success] = "Successfully saved expense to budget"
    else
      render :new
    end
  end
  
  private 
    def expense_parameters
      params.require(:expense).permit(:name, :amount, :date)
    end
end
