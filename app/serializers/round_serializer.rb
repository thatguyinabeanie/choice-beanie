class RoundSerializer < ActiveModel::Serializer
  attributes :id, :round_number, :phase_id
  attributes :started_at, :ended_at
end
