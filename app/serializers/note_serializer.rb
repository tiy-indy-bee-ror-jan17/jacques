class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at
  has_many :tags
    class TagSerializer < ActiveModel::Serializer
      attributes :name
    end
  belongs_to :user

end
