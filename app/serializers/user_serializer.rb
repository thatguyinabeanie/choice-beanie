module Serializer
  class User < ActiveModel::Serializer
    attributes :id, :username, :pronouns
  end

  class UserDetails < User
    attributes :email, :first_name, :last_name, :slug
  end
end
