module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    validates :name, presence: true
    has_one :game, class_name: 'Game', dependent: :nullify
    has_one :format, class_name: 'Tournament::Format', through: :tourname

    has_many :phases, class_name: 'Phase::Base', through: :tournament_phases
  end
end
