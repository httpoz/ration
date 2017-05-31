class ExpensesController < ApplicationController
  
  before_action :set_budget
  before_action :set_expense, only: [:edit, :update, :destroy]
  
  def index
    @expenses = @budget.expenses
  end
  
  def new
    # If not making new category
    if params[:category]
      @category = Category.find_by(id: params[:category])
      # Checks if category is included in budget
      if @budget.categories.include?(@category)
        @expense = Expense.new(category_id: @category.id)
      else
        redirect_to @budget, danger: 'Category not found'
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
      @category = Category.find_or_create_by(name: params[:category_name])
    else
      @category = Category.find(params[:expense][:category_id])
    end
    @expense.category_id = @category.id
    
    if @expense.save 
      redirect_to @budget, notice: 'Successfully created expense'
    else
      render :new
    end
  end
  
  def edit
    @category = @expense.category
  end
  
  def update
    if @expense.update_attributes( expense_parameters )
      redirect_to budget_expenses_path(@budget), notice: 'Successfully update expense'
    else
      render :edit
    end
  end
  
  def destroy
    @expense.delete
    redirect_to budget_expenses_path(@budget), alert: 'Successfully deleted expense' 
  end
  
  private
    def set_expense
      @expense = @budget.expenses.find(params[:id])
    end
    
    def set_budget
      @budget = Budget.find(params[:budget_id])
    end
      
    def expense_parameters
      params.require(:expense).permit(:name, :amount, :date, :category_id)
    end
end
