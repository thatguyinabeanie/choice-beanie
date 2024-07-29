module Serializer
  class User
    include JSONAPI::Serializer
    attributes :id, :username, :pronouns
  end

  class UserDetails < User
    include JSONAPI::Serializer
    attributes :email, :first_name, :last_name, :slug
  end
end
