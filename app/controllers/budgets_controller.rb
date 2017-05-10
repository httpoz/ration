class BudgetsController < ApplicationController 
  
  def new
    @budget = Budget.new
  end
  
  def create
    # This will instead be build through User association
    # With User.budgets.build
    @budget = Budget.new( budget_params )
    if @budget.save
      # Should redirect to User where budget can be displayed
      redirect_to @budget
    else
      # Error message should display¨
      render :new
    end
  end
  
  # Will be removed since budget will be showed through user
  def show
    @budget = Budget.find( params[:id] )
    # This should come from a categorys table
    @categorys = %w(rent car phone travel electricity wifi groceries insurance)
  end
  
  private
    def budget_params
      params.require(:budget).permit(:name)
    end
  
end