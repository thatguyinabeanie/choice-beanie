module Phase
  class BasePhase < ApplicationRecord
    self.table_name = 'phases'
    self.abstract_class = true
    has_many :rounds, class_name: 'Tournament::Round', inverse_of: :phase, dependent: :destroy

    belongs_to :tournament, class_name: 'Tournament::Tournament'

    validates :name, presence: true
    validates :best_of, numericality: { greater_than: 0, only_integer: true }
    # Optionally, validate best_of to be odd to ensure decisiveness
    validate :best_of_must_be_odd

    private

    def best_of_must_be_odd
      errors.add(:best_of, 'must be odd') unless best_of.odd?
    end
    # has_many :rounds, class_name: 'Tournament::Round', dependent: :destroy

    # delegate :organization, to: :tournament
    # delegate :game, to: :tournament

    # validates :tournament, presence: true
    # validates :phase, presence: true
  end
end
