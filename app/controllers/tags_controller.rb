class TagsController < ApplicationController

  def by_tag
    @tag = Tag.find_by(name: params[:id])
    render json: @tag, include: '**'
    # render json: @tag, include: ['notes.tags', 'notes.user']
  end

end
