class ApplicationController < ActionController::API


  def request_error(msg)
    render json: {errors: msg.map{ |m| { error: m }}}, status: 400
  end
end
