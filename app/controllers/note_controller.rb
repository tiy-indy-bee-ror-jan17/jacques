class NoteController < ApplicationController

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
    if @note.save
      render json: @note
    else
      render json: {errors: @note.errors.full_messages.collect { |e| {error: e}}}, status: 400
    end

  end

  def by_tag_name
    @tags = Tag.find_by(name: params[:name])
    @tags.notes
    render json: @tags, include: ['notes.tags', 'notes.user']
  end

  private

  def note_params
    pre_tags = params.permit(:title, :body, :tags, :username, :user)
    tags = []
    pre_tags[:tags].split(/\s*,\s*/).each do |name|
      tags << Tag.find_or_create_by!(name: name)
    end
    pre_tags[:tags] = tags
    return pre_tags
  end

end
