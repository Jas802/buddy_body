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

   def create_from_facebook
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'sessions/welcome'
   end

  
    def destroy
      session.delete("user_id")
      redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end