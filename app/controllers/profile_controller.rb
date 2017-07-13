class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  respond_to :json, only: [:update, :update_password]

  def index
  end

  def update

  end

  def update_password

  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

end