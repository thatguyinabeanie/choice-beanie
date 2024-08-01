require_relative 'serializer_mixins'
module Serializer
  module UserMixin
    extend ActiveSupport::Concern
    included do
      include IdMixin

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