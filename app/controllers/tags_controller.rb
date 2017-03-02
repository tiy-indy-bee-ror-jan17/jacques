class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(name: params[:name])
    render json: @tag
  end

end
