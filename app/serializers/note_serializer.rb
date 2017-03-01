class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :username

  def username
    object.user.username
  end
  
end
