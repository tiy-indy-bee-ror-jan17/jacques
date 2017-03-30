class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(name: params[:id])
    render json: @tag, include: ['notes.tags', 'notes.user'], meta: meta_dict
  end

end
