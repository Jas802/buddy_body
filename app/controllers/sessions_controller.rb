class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
  

    def welcome
    end
  
    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         sessions[:user_id] = @user.id
         redirect_to '/welcome'
      else
         redirect_to '/login'
      end
   end
  
    def destroy
      session.delete("user_id")
      redirect_to root_path
    end
  end