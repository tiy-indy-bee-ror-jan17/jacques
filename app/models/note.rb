class Note < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :user, optional: true

  validates :title, :body, presence: true


end
