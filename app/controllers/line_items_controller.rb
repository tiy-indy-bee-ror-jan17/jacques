class LineItemsController < ApplicationController

  # Add something to the cart
  def create
    item = current_cart.line_items.new(item_params)
    if item.save
      render json: current_cart, meta: meta_dict
    else
      render json: {errors: item.errors.full_messages.map{|e| {error: e}}}, status: 400
    end
  end

  # Update quantity of item in cart
  def update
    item = current_cart.line_items.find(params[:id])
    if item.update(params[:quantity])
      render json: current_cart, meta: meta_dict
    else
      render json: {errors: item.errors.full_messages.map{|e| {error: e}}}, status: 400
    end
  end

  # Remove from cart
  def destroy
    item = current_cart.line_items.find(params[:id])
    item.destroy
    render json: current_cart, meta: meta_dict
  end

  private

  def item_params
    params.permit(:note_id, :quantity)
  end


end
