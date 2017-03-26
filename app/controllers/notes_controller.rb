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
    #Typically move this bottom section to a model to keep the controller light
    if @note.save
      # params[:tags].split(',').each do |name|
      #   tag = Tag.find_or_create_by(name: name)
      #   @note.tags << tag
      # end
      render json: @note
    else
      render json: {errors: @note.errors.full_messages.collect{ |e|{error: e}}}, status: 400
    end
  end

  private

  def note_params
    params.permit(:title, :body)
  end

end
