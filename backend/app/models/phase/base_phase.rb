module Phase
  class BasePhase < ApplicationRecord
    self.table_name = 'phases'
    self.inheritance_column = 'type'
    self.abstract_class = true

    belongs_to :tournament, class_name: 'Tournament::Tournament'
    delegate :organization, to: :tournament

    has_many :rounds, class_name: 'Tournament::Round', inverse_of: :phase, dependent: :destroy

    has_many :phase_players, class_name: 'Tournament::PhasePlayer', inverse_of: :phase, dependent: :destroy
    has_many :players, through: :phase_players, source: :player, class_name: 'Tournament::Player'

    validates :name, presence: true
    validates :best_of, numericality: { greater_than: 0, only_integer: true }, presence: true

    validate :best_of_must_be_odd
    validates :type, presence: true
    validates :tournament, presence: true

    def accept_players(players:)
      self.players = players
    end

    def players_ready
      players_checked_in.where(team_sheet_submitted: true)
    end

    def players_checked_in
      players.where(checked_in_at: nil)
    end

    def players_not_checked_in_has_team_sheet
      players_not_checked_in.where(team_sheet_submitted: true)
    end

    def players_not_checked_in
      players.where.not(checked_in_at: nil)
    end

    def players_checked_in_no_team_sheet
      players_checked_in.where(team_sheet_submitted: false)
    end

    def players_not_checked_in_or_no_team_sheet
      players_not_checked_in.where(team_sheet_submitted: false)
    end

    private

    def best_of_must_be_odd
      errors.add(:best_of, I18n.t('errors.phase.best_of_must_be_odd')) unless best_of.odd?
    end
  end
end
