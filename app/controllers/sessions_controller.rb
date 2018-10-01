class SessionsController < ApplicationController
  def login_page
    
  end

  def create
    @user = User.find_by(name: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/welcome"
    else
      redirect_to :login
    end
  end
end
