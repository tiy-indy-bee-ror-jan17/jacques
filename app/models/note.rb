class Note < ApplicationRecord
  has_many      :taggings
  has_many      :tags,  through: :taggings
  belongs_to    :user,  required: false
  validates     :title, presence: true, allow_blank: false
  validates     :body,  presence: true
end
