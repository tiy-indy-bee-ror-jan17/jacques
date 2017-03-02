class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(name: params[:id])
    render json: @tag
  end
end
