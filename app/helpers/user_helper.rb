module UserHelper
    def require_login
        redirect_to 'sessions/welcome' unless apples
    end
    
    def apples
        !current_user.nil?
    end
    
    def current_user
        User.find_by(id: session[:user_id])
    end
end