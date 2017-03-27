class User < ApplicationRecord

  has_many :notes

  has_secure_token :api_token
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, :password, presence: true

end
