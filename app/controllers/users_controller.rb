class UsersController < ApplicationController

    def create
      user = User.new(params.permit(:username, :email, :password))
      if user.save
        render json: user, serializer: UserExpandedSerializer
      else
        errors = user.errors.full_messages
        errors.map!{ |error| Hash(error: error) }
        render json: Hash(errors: errors), status: 400
      end
    end

end
