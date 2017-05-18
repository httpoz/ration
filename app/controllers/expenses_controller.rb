class ExpensesController < ApplicationController
  
  before_action :set_budget
  
  def new
    # If not making new category
    if params[:category] 
      @category = Category.find_by(id: params[:category])
      # Checks if category is included in budget
      if @budget.categories.include?(@category)
        @expense = Expense.new(category_id: @category.id)
      else
        redirect_to @budget
        flash[:danger] = "Category not found"
      end
    else
      @expense = Expense.new
    end
  end
  
  def create
    @expense = @budget.expenses.build(expense_parameters) 
    
    # Checks if a category gets passed from the form
    if !params[:expense][:category_id]
      # Creates a new category from the expense form and assigns it to variable
      @category = Category.create(name: params[:category_name])
    else
      @category = Category.find(params[:expense][:category_id])
    end
    @expense.category_id = @category.id
    
    if @expense.save 
      redirect_to @budget
      flash[:success] = "Successfully saved expense to budget"
    else
      render :new
    end
  end
  
  private 
    def set_budget
      @budget = Budget.find(params[:budget_id])
    end
      
    def expense_parameters
      params.require(:expense).permit(:name, :amount, :date, :category_id)
    end
end
