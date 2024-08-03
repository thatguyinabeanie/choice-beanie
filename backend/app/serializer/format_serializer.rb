require_relative 'serializer_mixin'
module Serializer
  class Format < ActiveModel::Serializer
    include SerializerMixin::Id
    include SerializerMixin::Name
  end
end
