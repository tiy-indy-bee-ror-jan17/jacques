class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :tags, :user
  belongs_to :user
  has_many :tags

  def tags
    names = []
    object.tags.pluck(:name).each do |name|
      names << {'name' => name}
    end
    return names
  end
end
