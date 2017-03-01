class Tag < ApplicationRecord

  belongs_to :user
  has_many :taggings
  has_many :notes, through: :taggings

  validates :name, presence: true, uniqueness: true


end
