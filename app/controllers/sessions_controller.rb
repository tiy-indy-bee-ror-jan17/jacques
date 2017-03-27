class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])&.authenticate(params[:password])
    if @user
      render json: {api_token: @user.api_token}
    else
      render json: {api_token: nil}
    end
  end

  def destroy
    render json: {api_token: nil}
  end
end
