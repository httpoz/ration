class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = current_user.budgets.all
  end

  # GET /budgets/1/edit
  def edit
  end

  def new
    @budget = Budget.new
  end

  def create
    # This will instead be build through User association
    # With User.budgets.build
    @budget = current_user.budgets.new( budget_params )
    if @budget.save
      # Should redirect to User where budget can be displayed
      redirect_to @budget
    else
      # Error message should display¨
      render :new
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @categories = @budget.categories
  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end
  def budget_params
    params.require(:budget).permit(:name)
  end

end
