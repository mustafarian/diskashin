class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Log in successful!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Successfully Logged Out."
  end

  private
  def login_params
    params.permit(:username, :password)
  end
end
