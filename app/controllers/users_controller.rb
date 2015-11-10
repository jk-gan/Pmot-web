class UsersController < ApplicationController
  def new
    User.new
  end

  # def create(params)
  #   @user = User.new(params)
  #   if @user.save
  #     @user.created = true
  #   else
  #     @user.created = false
  #   end
  #   @user
  # end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
end
