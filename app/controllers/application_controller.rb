class ApplicationController < ActionController::API

  def static
    render html: File.open("#{Rails.root}/public/index.html").read.html_safe, status: 200
  end

  private

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
  end

  def meta_dict(collection=nil)
    if collection
      pagination = {
        pagination: {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
          total_pages: collection.total_pages,
          total_count: collection.total_count
        }
      }
    else
      pagination = {}
    end
    starter = ActiveModelSerializers::SerializableResource.new(current_cart).as_json
    starter.merge(pagination)
  end

  def current_cart
    return @cart if @cart
    if params[:cart_token]
      @cart = Cart.find_by(token: params[:cart_token])
    elsif current_user && current_user.cart
      @cart = current_user.cart
    elsif current_user
      @cart = current_user.cart.create!
    else
      @cart = Cart.create!(status: "active")
    end
  end

end
