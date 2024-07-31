class PhaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :type
  attributes :best_of, :number_of_rounds, :criteria, :order
  attributes :started_at, :ended_at, :created_at, :updated_at
  attributes :tournament_id
end

class PhaseDetailsSerializer < PhaseSerializer
  attribute :players, serializer: PlayerSerializer
  attribute :rounds, serializer: RoundSerializer
end
