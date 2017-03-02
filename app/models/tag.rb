class Tag < ApplicationRecord
  has_many    :taggings
  has_many    :notes, through: :taggings

  validates   :name, presence: true
  default_scope {order('name')}
end
