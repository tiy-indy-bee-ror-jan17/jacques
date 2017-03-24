class Tag < ApplicationRecord

  has_many :taggings
  has_many :notes, through: :taggings
  default_scope { order(name: :desc) }

  validates :name, presence: true#, uniqueness: true
end
