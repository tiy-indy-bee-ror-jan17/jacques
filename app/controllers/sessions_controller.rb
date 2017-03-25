class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])&.authenticate(params[:password])
    if @user
      session[:api_token] = @user.api_token
        # flash[:success] = "Welcome, #{@user.name}"
      redirect_to 'https://mstashev.github.io/deadbeat-jacques/'
    else
      # flash[:danger] = "Username or password is incorrect. Please try again."
      redirect_to 'https://mstashev.github.io/deadbeat-jacques/'
    end
  end

  def destroy
    session[:api_token] = nil
    redirect_to 'https://mstashev.github.io/deadbeat-jacques/'
  end
end
