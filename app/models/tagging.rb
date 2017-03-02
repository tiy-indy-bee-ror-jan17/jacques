class Tagging < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :note
  belongs_to :tag
end
