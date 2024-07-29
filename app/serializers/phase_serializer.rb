module Serializer
  class Phase < ActiveModel::Serializer
    attributes :id, :name, :type, :best_of, :number_of_rounds, :started_at, :ended_at, :created_at, :updated_at
  end
end
