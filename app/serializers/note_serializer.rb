class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body
  belongs_to :user
  has_many :tags
end
