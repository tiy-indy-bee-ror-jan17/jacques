class TagSerializer < ActiveModel::Serializer

  has_many :notes, through: :taggings
  attributes :name
end
