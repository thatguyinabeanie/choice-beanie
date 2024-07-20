module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    validates :name, presence: true
    belongs_to :game, class_name: 'Game'

    belongs_to :format, class_name: 'Tournament::Format', optional: true

    has_many :tournament_phases, class_name: 'Tournament::Phase', dependent: :destroy_async
    has_many :phases, through: :tournament_phases, source: :phase

    has_many :registrations, class_name: 'Tournament::Registration', dependent: :destroy_async

    validates :start_date, presence: true
    validates :format, presence: true

    validates :organization, uniqueness: true
  end
end
