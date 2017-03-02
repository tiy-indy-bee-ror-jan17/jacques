class UserPrivateSerializer < ActiveModel::Serializer
  attributes :username, :email, :api_token
end
