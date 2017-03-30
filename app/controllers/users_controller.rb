class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      result = ChargeStripe.new(
                @user,
                params[:stripeToken],
                500
               ).charge_them

      if result[:success]
        render json: @user, serializer: UserExpandedSerializer
      else
        render json: {errors: result}, status: 400
      end
    else
      render json: {errors: @user.errors.full_messages.map{|er| {error: er}}}, status: 400
    end
  end

#   # Amount in cents
#   @amount = 500
#
#   customer = Stripe::Customer.create(
#     :email => params[:stripeEmail],
#     :source  => params[:stripeToken]
#   )
#
#   charge = Stripe::Charge.create(
#     :customer    => customer.id,
#     :amount      => @amount,
#     :description => 'Rails Stripe customer',
#     :currency    => 'usd'
#   )
#
# rescue Stripe::CardError => e
#   flash[:error] = e.message
#   redirect_to new_charge_path

  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
