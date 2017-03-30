class CartSerializer < ActiveModel::Serializer
  attributes :id, :token, :status

  has_many :line_items
end
