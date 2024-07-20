module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    belongs_to :game, class_name: 'Game'

    belongs_to :format, class_name: 'Tournament::Format', optional: true

    has_many :tournament_phases, class_name: 'Tournament::Phase', dependent: :destroy_async
    has_many :phases, through: :tournament_phases, source: :phase

    has_many :registrations, class_name: 'Tournament::Registration', dependent: :destroy_async

    validates :name, presence: true
    validates :start_date, presence: true
    validates :format, presence: true
    validates :game, presence: true
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_date], message: 'should be unique per organization, name, and start date' }
  end
end
