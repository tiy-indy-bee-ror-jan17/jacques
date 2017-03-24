class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note

  validates :tag, :note, presence: true
end
