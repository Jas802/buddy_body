class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :welcome]
    helper_method :user_is_authenticated
  

    def welcome
    end
  
    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to '/welcome'
      else
         redirect_to '/login'
      end
   end

   #def googleAuth
      # Get access tokens from the google server
    ###log_in(user)
      # Access_token is used to authenticate request made from the rails application to the google server
     # user.google_token = access_token.credentials.token
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
      #refresh_token = access_token.credentials.refresh_token
      #user.google_refresh_token = refresh_token if refresh_token.present?
      #user.save
      #redirect_to root_path
    #end
  
    def destroy
      session.delete("user_id")
      redirect_to root_path
    end
  end