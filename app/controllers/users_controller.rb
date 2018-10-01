class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.create(params.require(:user).permit(:name, :password, :password_confirmation))
      session[:user_id] = user.id

      redirect_to action: "welcome"
    else
      redirect_to action: "new"
    end
  end

  def welcome
    render :welcome
  end
end
