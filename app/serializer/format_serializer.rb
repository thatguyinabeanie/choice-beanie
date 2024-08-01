require_relative 'serializer_mixins'
module Serializer
  class Format < ActiveModel::Serializer
    include IdMixin
    include NameMixin
  end
end
