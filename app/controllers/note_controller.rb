class NoteController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @notes = Note.new(note_params)
    if @notes.save
      render json: @notes
    else
      render json: @notes.errors.full_messages, status: 400
    end
  end




  private

  def note_params
    params.require(:note).permit(:title, :body, :tags)
  end

end
