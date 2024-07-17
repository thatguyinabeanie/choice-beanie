module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    validates :name, presence: true
    has_one :game, class_name: 'Game', dependent: :nullify

    belongs_to :format, class_name: 'Tournament::Format', optional: true

    has_many :tournament_phases, class_name: 'Tournament::Phase', dependent: :destroy
  end
end
