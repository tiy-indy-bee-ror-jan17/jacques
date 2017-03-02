class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user #need to write serializer
    else
      request_error(@user.errors.full_messages)
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
end
