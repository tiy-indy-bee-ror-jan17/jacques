class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserPrivateSerializer
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def show
    render json: current_user
  end

  def notes
    render json: current_user.notes
  end


  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
