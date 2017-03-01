class Note < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tags, through: :taggings
  has_many :taggings

  validates :title, :body, presence: true
end
