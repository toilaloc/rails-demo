class Admin::UsersController < ApplicationController
    def index
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new user_params
      if @user.save
        flash[:message] = "Register success"
        redirect_to admin_users_path
      else
        flash[:message] = "Register failed"
        render :new
      end
    end
  
    def show
      @user = User.find_by id: params[:id]
    end

    def edit
        @user = User.find_by id: params[:id]
    end

    def update
        @user = User.find_by id: params[:id]
        if @user.update_attributes(user_params)
            flash[:messagge] = "Updated!"
            redirect_to admin_users_path
        else
            flash[:message] = "Update failed!!!"
            render :edit
        end
    end
    
  
    private
    def user_params
      params.require(:user).permit :username, :fullname, :password, :password_confirm, :email, :address, :avatar, :role_id
    end
end
