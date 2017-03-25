class ApplicationController < ActionController::API

  def index
    # I know this is not a future-friendly way to do this. Wouldn't do this in production.
    # But I am comfortable with the demonstrated way to do this. So I turned to this to
    # exercise monkey patching w/ `super`
    if params[:api_token]
      @live_user ||= User.find_by(api_token: params[:api_token])
    end
  end

  private

  def require_user
    render json: {error: "You must be logged in"}, status: 401 unless current_user
  end

  def forbid_user
    render json: {error: "You're already logged in"}, status: 401 if current_user
  end

end
