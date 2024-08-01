require_relative 'mixin_serializer'
module Serializer
  class Format < ActiveModel::Serializer
    include Serializer::Mixin::Id
    include Serializer::Mixin::Name
  end
end
