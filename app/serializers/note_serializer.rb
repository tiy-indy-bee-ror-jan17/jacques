class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at
  has_one :user
  has_many :tags
    class TagSerializer < ActiveModel::Serializer
      attributes :name
    end


end
