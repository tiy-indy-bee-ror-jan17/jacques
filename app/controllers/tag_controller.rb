class TagController < ApplicationController

  def search
    tags = Tag.find_by(name: params[:tag])
      render json: tags
  end

end
