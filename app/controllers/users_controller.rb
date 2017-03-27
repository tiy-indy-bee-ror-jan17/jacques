class UsersController < ApplicationController

    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        render json: user, serializer: UserExpandedSerializer
      else
        render json: error_up(user, 'Not so fast, bucko! You must enter a valid combination of username and password.', 401)
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, serializer: UserExpandedSerializer
      else
        errors = user.errors.full_messages
        errors.map!{ |error| Hash(error: error) }
        render json: Hash(errors: errors), status: 400
      end
    end

    private

    def user_params
      params.permit(:username, :email, :password)
    end

end
