class Note < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :taggings
  has_many :tags, through: :taggings
  
end
