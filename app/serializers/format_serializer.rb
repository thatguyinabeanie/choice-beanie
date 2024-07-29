module Serializer
  class Format
    include JSONAPI::Serializer
    attributes :id, :name
  end
end
