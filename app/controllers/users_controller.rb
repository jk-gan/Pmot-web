class UsersController < ApplicationController
  def new
    User.new
  end

  def create
    user.new(user_params)
    if @user.save
      @user.created = true
    else
      @user.created = false
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :status)
  end
end
