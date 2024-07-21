# Join table between Tournament and Phase
module Tournament
  class Phase < ApplicationRecord
    self.table_name = 'tournament_phases'
    belongs_to :tournament, class_name: 'Tournament::Tournament'
    belongs_to :phase

    validates :tournament, presence: true
    validates :phase, presence: true

    has_many :rounds, class_name: 'Tournament::Round', dependent: :destroy
  end
end
