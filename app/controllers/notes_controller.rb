class NotesController < ApplicationController

  def index
    @notes = case
    when params[:tag]
      Tag.find_by(name: params[:tag])
    when params[:api_token]
      User.find_by(api_token: params[:api_token]).notes
    else Note.all
    end
    render json: @notes
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      params[:tags].split(',').each{ |t| @note.tags << Tag.find_or_create_by(name: t.strip) }
      render json: @note
    else
      request_error(@note.errors.full_messages)
    end
  end

  private

  def note_params
    params.permit(:title, :body)
  end

end
