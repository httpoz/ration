class DashboardController < ApplicationController
  before_action :authenticate_user!


  def index
    @expenses = current_user.expenses
  end
end
