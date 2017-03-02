class UsersController < ApplicationController

  def create
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    render json: @user
  else
    render json: @user.errors.full_messages, status: 400
  end
end

end
