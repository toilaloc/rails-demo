module AuthenticationHelper
    def log_in user
        session[:user_id] = user.id
        session[:fullname] = user.fullname
      end
    
      def log_out
        session.delete :user_id
        session.delete :fullname
      end
    
      # get current user
      def current_user
        @current_user ||= User.find_by id: session[:user_id]
      end

      def is_admin?
        if @current_user.present?
            @current_user.role_id == 0
        end
      end
    
      # check user logged or not
      def logged_in?
        current_user.present?
      end
end
