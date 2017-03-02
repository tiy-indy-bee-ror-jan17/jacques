class NotesController < ApplicationController

  def index
    if params[:api_token]
      @notes = User.find_by(api_token: params[:api_token]).notes
      render json: @notes
    else
      @notes = Note.all
      render json: @notes
    end
  end

  def create
    hash_tags = params[:tags].split(", ").map{ |tag| Tag.find_or_create_by(name: tag) }
    @note = Note.new(title: params[:title], body: params[:body], tags: hash_tags)
    if @note.save
      render json: @note
    else
      render json: { errors: @note.errors.full_messages.map{ |message| { error: message } } }, status: 400

    end
  end

end
