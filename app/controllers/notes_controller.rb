class NotesController < ApplicationController

  def index
    # binding.pry
    if current_user
      @notes = current_user.notes
    else
      @notes = Note.all
    end
    # binding.pry
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note
    else
      error = @note.errors.full_messages.collect do |error_message|
        {:error => error_message}
      end
      @errors = {:errors => error}
      render json: @errors, status: 400
    end
  end

  private

  def note_params
    pre_note_params = params.permit(:title,
                             :body,
                             :tags,
                             :user_id)
    tags = Array.new
    pre_note_params[:tags].split(%r{,\s*}).each do |name|
      tags << Tag.find_or_create_by(name: name)
    end
    pre_note_params[:tags] = tags
    return pre_note_params
  end

end
