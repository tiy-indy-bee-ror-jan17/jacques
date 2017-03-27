class Note < ApplicationRecord

  belongs_to :user, required: false

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

  default_scope {order(created_at: :desc)}


end
