class Note < ApplicationRecord

  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy

  belongs_to :user, optional: true

  validates :title, :body, presence: true

end
