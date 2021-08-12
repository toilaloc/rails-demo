class AuthenticationController < ApplicationController
    skip_before_action :require_login, only: [:signin, :handle_signin, :signup, :handle_signup]
    skip_before_action :admin_guard, only: [:signin, :handle_signin, :signup, :handle_signup, :logout]

  def signin
  end

  def handle_signin
    user = User.find_by username: params[:session][:username]
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def signup
    @user = User.new
  end

  def handle_signup
    @user = User.new user_params
    if @user.save
      flash[:message] = "Register success"
      redirect_to root_path
    else
      flash[:message] = "Register failed"
      render :handle_signup
    end
  end

  def logout
    log_out
    flash[:success] = "You are logged out"
    redirect_to signin_path
  end

  private
  def user_params
    defaults = { role_id: 1 }
    params.require(:authencation).permit(:username, :fullname, :password, :password_confirm, :email, :address, :avatar, :role_id).reverse_merge(defaults)
  end
end
