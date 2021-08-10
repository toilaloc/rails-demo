class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:message] = "Register success"
      redirect_to users_path
    else
      flash[:message] = "Register failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :username, :fullname, :password, :password_confirm, :email, :address, :avatar
  end
end
