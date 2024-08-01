require_relative 'mixin_serializer'
module Serializer
  class Format < ActiveModel::Serializer
    include SerializerMixin::Id
    include SerializerMixin::Name
  end
end
