class Note < ApplicationRecord

  belongs_to :user, optional: true
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

end
