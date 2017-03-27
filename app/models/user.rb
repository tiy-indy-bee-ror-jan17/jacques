class User < ApplicationRecord
  has_many :notes

  has_secure_password
  has_secure_token :api_token

  validates :username, :email, presence: true, uniqueness: true
end
