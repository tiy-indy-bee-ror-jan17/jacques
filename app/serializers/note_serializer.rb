class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :tags, :user

  def tags
    object.tags.map { |tag| { name: tag.name } }
  end

  def user
    { username: object.user.username } if object.user
  end
end
