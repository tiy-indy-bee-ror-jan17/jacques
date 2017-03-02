class UserController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    end
  end


  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
