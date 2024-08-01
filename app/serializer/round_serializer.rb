require_relative serializer_mixin
module Serializer
  class Round < ActiveModel::Serializer
    include SerializerMixin::Id
    attributes :round_number, :phase_id
    attributes :started_at, :ended_at
  end
end
