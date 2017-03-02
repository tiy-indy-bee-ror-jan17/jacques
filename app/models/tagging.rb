class Tagging < ApplicationRecord
  belongs_to :note
  belongs_to :tag

  validates :tag, :note, presence: true
end
