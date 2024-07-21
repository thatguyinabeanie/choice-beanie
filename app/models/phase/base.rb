module Phase
  class Base < ApplicationRecord
    self.table_name = 'phases'
    self.abstract_class = true
    validates :name, presence: true

    has_one :tournament_phase, class_name: 'Tournament::Phase', dependent: :destroy
    has_one :tournament, through: :tournament_phase

    # has_many :rounds, class_name: 'Tournament::Round', dependent: :destroy

    # delegate :organization, to: :tournament
    # delegate :game, to: :tournament

    # validates :tournament, presence: true
    # validates :phase, presence: true
  end
end
