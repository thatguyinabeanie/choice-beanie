class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :created_at
end
