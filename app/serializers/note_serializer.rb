class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at

  has_many :tags
  belongs_to :user

  before_action :default_user, only: [:createf]

  def default_user
    @note = Note.find_by(username: params[:username])
    if @note.user.username.nil
      note.user.username = "anonymous"
    else
      @note.user.username
    end
  end

end
