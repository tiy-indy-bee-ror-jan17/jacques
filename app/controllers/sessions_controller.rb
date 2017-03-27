class SessionsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: @user, serializer: UserPrivateSerializer
    end
  end

end
