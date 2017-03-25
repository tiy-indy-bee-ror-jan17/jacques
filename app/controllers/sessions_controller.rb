class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])&.authenticate(params[:password])
    if @user
      session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}"
      redirect_to :index
    else
      flash[:danger] = "Username or password is incorrect. Please try again."
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
