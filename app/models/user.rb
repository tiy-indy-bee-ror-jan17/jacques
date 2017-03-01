class User < ApplicationRecord
  has_many :notes, dependent: :restrict_with_error

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end 
