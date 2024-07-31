class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :pronouns
end

class UserDetailsSerializer < UserSerializer
  attributes :email, :first_name, :last_name
end
