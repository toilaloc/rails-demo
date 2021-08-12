class HomeController < ApplicationController
 skip_before_action :require_login, only: [:index]
 skip_before_action :admin_guard, only: [:index]
  def index
    @users = User.all
  end  
end
