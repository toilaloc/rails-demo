class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    include AuthenticationHelper

    before_action :require_login, :admin_guard

    def require_login
        unless logged_in?
            redirect_to login_path
        end
    end

    def admin_guard
        unless is_admin?
            redirect_to root_path
        end
    end

end
