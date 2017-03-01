class TagController < ApplicationController

  def search
    tags = Tag.find_by(name: params[:post])
    if tags
      render json: tags.post
    else
      render json: tags.errors.full_messages
    end
  end

end
