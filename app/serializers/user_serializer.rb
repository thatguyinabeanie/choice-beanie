class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :pronouns
end

class UserDetailsSerializer < UserSerializer
  attributes :id, :username, :pronouns
  attributes :email, :first_name, :last_name, :slug
end
