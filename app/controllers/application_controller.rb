class ApplicationController < ActionController::API


  def request_error(msg, code = 400)
    render json: {errors: msg.map{ |m| { error: m }}}, status: code
  end

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
  end

  def require_user
      request_error(["You need to be logged in."], 401) unless current_user
  end
end
