class TagsController < ApplicationController

  def by_tag
    @tag = Tag.find_by(name: params[:id])
    render json: @tag, include: '**'
  end

end
