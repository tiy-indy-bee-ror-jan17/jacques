class ApplicationController < ActionController::API

  private

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

end
