class TagController < ApplicationController

  def search
    @tag = Tag.find_by(name: params[:name])
      render json: @tag, include: ['notes.tags', 'notes.user']
  end

end
