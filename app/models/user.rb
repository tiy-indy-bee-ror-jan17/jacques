class User < ApplicationRecord

  has_many :notes
  has_many :tags

  has_secure_password
  has_secure_token :auth_token

end
