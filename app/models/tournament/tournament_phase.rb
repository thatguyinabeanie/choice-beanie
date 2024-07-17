module Tournament
  class TournamentPhase < ApplicationRecord
    self.table_name = 'tournament_phases'
    belongs_to :tournament, class_name: 'Tournament::Tournament'

    belongs_to :phase, class_name: 'Phase::Base'
  end
end
