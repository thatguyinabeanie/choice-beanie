require_relative 'mixin_serializer'
module Serializer
  class Round < ActiveModel::Serializer
    include SerializerMixin::Id
    attributes :round_number, :phase_id
    attributes :started_at, :ended_at
  end
end
