class ApplicationController < ActionController::API

  def index
    @live_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
  end

  private

  def error_up(class_instance, message, status = 400)
    return Hash(error:  message,
                status: status)
  end

end
