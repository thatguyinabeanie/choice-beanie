module Phase
  class Base < ApplicationRecord
    self.table_name = 'phases'
    self.abstract_class = true
    validates :name, presence: true
    has_many :rounds, class_name: 'Tournament::Round', inverse_of: :phase, dependent: :destroy

    belongs_to :tournament, class_name: 'Tournament::Tournament'

    # has_many :rounds, class_name: 'Tournament::Round', dependent: :destroy

    # delegate :organization, to: :tournament
    # delegate :game, to: :tournament

    # validates :tournament, presence: true
    # validates :phase, presence: true
  end
end
