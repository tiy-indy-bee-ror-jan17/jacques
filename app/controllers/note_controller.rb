class NoteController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @notes = Note.new(note_params)
    params[:tags].split(",").each do |name|
      tag = Tag.find_or_initialize_by(name: name)
      @notes.tags << tag
    end
    if @notes.save
      render json: @notes
    else
      render json: {errors: @notes.errors.full_messages.collect { |err| {error: err } } }, status: 400
    end
  end




  private

  def note_params
    params.permit(:title, :body)
  end

end
