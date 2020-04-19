class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :welcome]
    helper_method :user_is_authenticated
  
    def new
      @user = User.new
      render 'login'
    end
   
    def welcome
    end
  
    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         flash[:notice] = "Logged in successfully"
         redirect_to user_path(@user)
      else
        flash.now[:alert] = "Invalid username/password"
         redirect_to new_user_path
      end
   end

   def create_from_github
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
    session[:user_id] = user.id     redirect_to root_path, :notice => "Signed in!"
    end

  
    def delete
      session[:user_id] = nil
      flash[:notice] = "You have been logged out"
      redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end