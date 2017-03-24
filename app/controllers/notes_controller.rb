class NotesController < ApplicationController

  def index
    if current_user
      @notes = current_user.notes
    else
      @notes = Note.all
    end
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    params[:tags].split(',').each do |name|
      tag = Tag.find_or_create_by(name: name)
      @note.tags << tag
    end
    if current_user
      @note = current_user.notes.new!
      render json: @note, serializer: NoteSerializer
    elsif @note.save
      render json: @note, serializer: NoteSerializer
    else
      render json: {errors: @note.errors.full_messages.map{ |e|{error: e}}}, status: 400
    end
  end

  def update
    @note = current_user.notes.find(params[:id])
    @note.update(note_params)
  end

  private

   def note_params
     params.permit(:title, :body)
   end

end
