class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception
        before_action :require_login
        helper_method :current_user
        add_flash_types :danger, :warning, :info, :success
    
      private
    
      def require_login
        redirect_to 'sessions/welcome' unless user_is_authenticated
      end
    
      def user_is_authenticated
        !current_user.nil?
      end
    
      def current_user
        User.find_by(id: session[:user_id])
      end
end