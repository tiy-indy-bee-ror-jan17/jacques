class NotesController < ApplicationController

  def index
    if params[:api_token].present?
      user = User.find_by(api_token: params[:api_token])
      notes = user.notes
    else
      notes = Note.all
    end
    render json: notes
  end

  def create
    note = Note.new(title: params[:title], body: params[:body])
    if params[:tags].present?
      params[:tags].split(", ").each do |tag|
        new_tag = Tag.find_or_create_by(name: tag)
        note.tags << new_tag
      end
    end
    if params[:api_token].present?
      user = User.find_by(api_token: params[:api_token])
      note.user = user
    end
    if note.save
      render json: note
    else
      render json: { errors: note.errors.full_messages.map { |err_msg| { error: err_msg } } }, status: 400
    end
  end

  def update
    if params[:api_token].present?
      user = User.find_by(api_token: params[:api_token])
      note = user.notes.find_by(id: params[:id])
      note.update(note_params)
      if note.save
        render json: note
      else
        render json: { errors: note.errors.full_messages.map { |err_msg| { error: err_msg } } }, status: 400
      end
    else
      render status: 400
    end
  end

  def welcome
    render text: "Welcome to Jacquesopolis"
  end

  private

  def note_params
    params.permit(:title, :body)
  end

end
