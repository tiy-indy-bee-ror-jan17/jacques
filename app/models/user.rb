class User < ApplicationRecord

  has_many :notes
  has_many :tags, through: :taggings

  has_secure_token :api_token
  has_secure_password

end
