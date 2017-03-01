class ApplicationController < ActionController::API
  private

  def current_user
    @current_user ||= User.find_by(auth_token: params[:auth_token]) if params[:auth_token]
  end

  def require_user
    render json: {error: "You must be logged in"}, status: 401 unless current_user
  end

  def forbid_user
    render json: {error: "You're already logged in"}, status: 401 if current_user
  end
end
