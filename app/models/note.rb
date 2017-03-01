class Note < ApplicationRecord

  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

end
