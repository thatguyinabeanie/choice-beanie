require_relative 'mixin_serializer'
module Serializer
  class Round < ActiveModel::Serializer
    include Serializer::Mixin::Id
    attributes :round_number, :phase_id
    attributes :started_at, :ended_at
  end
end
