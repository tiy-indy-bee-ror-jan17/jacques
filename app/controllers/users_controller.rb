class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    else
      error = @user.errors.full_messages.collect do |error_message|
        {:error => error_message}
      end
      @errors = {:errors => error}
      render json: @errors, status: 400
    end
  end


  def user_params
    params.permit(:username, :email, :password)
  end

end
