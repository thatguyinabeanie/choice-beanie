require_relative 'mixin_serializer'
module Serializer
  module UserMixin
    extend ActiveSupport::Concern
    included do
      include ::Serializer::Mixin::Id
      attributes :username, :pronouns
    end
  end

  class User < ActiveModel::Serializer
    include UserMixin
  end

  class UserDetails < ActiveModel::Serializer
    include UserMixin
    attributes :email, :first_name, :last_name
  end
end
