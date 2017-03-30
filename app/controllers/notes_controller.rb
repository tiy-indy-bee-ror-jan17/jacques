class NotesController < ApplicationController

  def index
    Rails.logger.info params[:q].inspect
    if current_user
      @notes = current_user.notes.ransack(params[:q]).result
    else
      @notes = Note.ransack(params[:q]).result
    end
    if params[:search]
      @notes = @notes.search_title_and_body(params[:search])
    end
    @notes = @notes.page(params[:page])
    render json: @notes, meta: pagination_dict(@notes)
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      # Make tags
      render json: @note
    else
      render json: {errors: @note.errors.full_messages.map{|e| {error: e}}}, status: 400
    end
  end

  private

  def note_params
    params.permit(:title, :body, :tags)
  end

end
