class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note

  validates :tag, presence: true
  validates :note, presence: true
end
