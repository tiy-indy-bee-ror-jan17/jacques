class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :api_token, :email

  has_one :cart
  has_many :orders
end
