require_relative 'serializer_mixins'
module Serializer
  class Round < ActiveModel::Serializer
    include IdMixin
    attributes :round_number, :phase_id
    attributes :started_at, :ended_at
  end
end
