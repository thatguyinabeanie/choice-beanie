# Join table between Tournament and Phase
module Tournament
  class Phase < ApplicationRecord
    self.table_name = 'phases'
    belongs_to :tournament, class_name: 'Tournament::Tournament'
    has_many :rounds, class_name: 'Tournament::Round', dependent: :destroy

    delegate :organization, to: :tournament
    delegate :game, to: :tournament
  end
end
