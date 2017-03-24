class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:name])
    render json: @tag, include: ['notes.tags', 'notes.user']
  end

end
