class Note < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :user

  validates :title, :body, presence: true


end
