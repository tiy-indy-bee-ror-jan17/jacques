class User < ApplicationRecord
  has_many :notes, dependent: :restrict_with_error

  has_secure_password
  has_secure_token :api_token

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
