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
    if current_user
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
    else
      render json: {:error => "need to be logged in"}
      @errors = {:errors => error}
      render json: @errors, status: 400
    end
  end

  private

  def note_params
    params[:user_id] = User.find_by(api_token: params[:api_token]).id

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
