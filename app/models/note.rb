class Note < ApplicationRecord
  has_many :taggings
  belongs_to :user, optional: true
  has_many :tags, through: :taggings

  validates :title, :body, presence: true
end
