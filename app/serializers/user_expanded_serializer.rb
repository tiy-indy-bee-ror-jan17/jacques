class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :api_token, :email
end
