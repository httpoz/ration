class IncomesController < ApplicationController
  before_action :set_budget
  
  def new
    @income = Income.new
  end
  
  def create
    @income = @budget.incomes.build(income_params)
    if @income.save
      redirect_to @budget, notice: "Successfully added income to #{@budget.name}"
    else
      render :new
    end
  end
  
  private
    def income_params
      params.require(:income).permit(:budget_id, :name, :amount, :date)
    end
    
    def set_income
      @income = Budget.incomes.find(params[:id])
    end
    
    def set_budget
      @budget = current_user.budgets.find(params[:budget_id])
    end
end