class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :tags, :user
  has_many :tags
  has_one :user

  def tags
    names = []
    object.tags.pluck(:name).each do |name|
      names << {:name => name}
    end
    return names
  end
end
