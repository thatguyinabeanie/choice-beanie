# Join table between Tournament and Phase
module Tournament
  class Phase < ApplicationRecord
    belongs_to :tournament, class_name: 'Tournament::Tournament'
    belongs_to :phase, class_name: 'Phase::Base'
    has_many :rounds, dependent: :destroy
  end
end
