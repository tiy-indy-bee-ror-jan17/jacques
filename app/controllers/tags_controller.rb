class TagsController < ApplicationController

  def show
    render json: Tag.find_by(name: params[:name])
  end

end
