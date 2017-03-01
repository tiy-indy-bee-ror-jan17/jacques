class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body

  def username
    object.user.username
  end

end
