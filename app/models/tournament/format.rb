# typed: true

module Tournament
  class Format < ApplicationRecord
    validates :name, presence: true
    belongs_to :game

    # Updated associations
    # has_many :tournament_formats, class_name: 'Tournament::TournamentFormat', dependent: :destroy
    # has_many :tournaments, through: :tournament_formats, class_name: 'Tournament::Tournament'
  end
end
