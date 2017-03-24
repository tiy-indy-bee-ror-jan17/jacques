class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :email, :api_token, :id
end
