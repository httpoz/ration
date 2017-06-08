class ExpensesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_budget
  before_action :set_expense, only: [:edit, :update, :destroy]
  
  def index
    # Orders expenses by passed param or defaults to order by category
    @expenses = @budget.expenses.includes(:category).order_by(params[:order_by] || :category_id, params[:direction])
  end
  
  def new
    # Sets the expense's category if creating through a category
    @expense = Expense.new(category_id: params[:category])
  end
  
  def create
    @category = Category.find_or_create_by(name: expense_parameters[:category][:name])
    e_params = expense_parameters
    e_params.delete(:category)
    @expense = @budget.expenses.build(e_params)
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
    @category = Category.find_or_create_by(name: expense_parameters[:category][:name])
    e_params = expense_parameters
    e_params.delete(:category)
    @expense.category_id = @category.id
    if @expense.update_attributes( e_params )
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
      params.require(:expense).permit(:name, :amount, :date, :category => [ :name ] )
    end
end
