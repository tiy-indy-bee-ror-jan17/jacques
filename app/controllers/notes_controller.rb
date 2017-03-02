class NotesController < ApplicationController

  def index
    super
    notes = @live_user ? @live_user.notes : Note.all
    render json: notes
  end

  def create
    note = Note.new(with_tags_converted)
    if note.save
      render json: note
    else
      errors = note.errors.full_messages
      errors.map!{ |error| Hash(error: error) }
      render json: Hash(errors: errors), status: 400
    end
  end

  private

  def with_tags_converted
    pre_note = params.permit(:title,
                             :body,
                             :tags,
                             :user)
    tags = []
    pre_note[:tags].split(/\s*,\s*/).each do |name|
      tags << Tag.find_or_initialize_by(name: name)
    end
    pre_note[:tags] = tags
    return pre_note
  end

end
