class TagsController < ApplicationController

  def index
    @tag = Tag.find_by(name: params[:tag])
    render json: @tag, include: ['notes.tags', 'notes.user']
  end

end

# , serializer: TagExpandedSerializer
