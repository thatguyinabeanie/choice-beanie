class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :created_at
end
