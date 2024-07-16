# typed: true

module Tournament
  class Format < ApplicationRecord
    self.table_name = 'tournament_formats'
    validates :name, presence: true
    belongs_to :game
  end
end
