module Tournament
  class Tournament < ApplicationRecord
    self.table_name = 'tournaments'
    MINIMUM_PLAYER_COUNT = 4
    # High level tournament information
    validates :name, presence: true
    validates :name, uniqueness: { scope: :organization_id, message: I18n.t('tournament.errors.validations.unique_per_org_name_start_at') }
    belongs_to :organization, class_name: 'Organization::Organization'
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_at], message: I18n.t('tournament.errors.validations.unique_per_org_name_start_at') }

    # Tournament Game and Format Information
    belongs_to :game, class_name: 'Game'
    validates :game, presence: true
    belongs_to :format, class_name: 'Tournament::Format'
    validates :format, presence: true
    has_many :phases, class_name: 'Phase::BasePhase', dependent: :destroy_async

    # Tournament Logistics Information
    # validates :start_at, presence: true
    # validates :end_at, presence: true
    # validates :registration_start_at, presence: true
    # validates :registration_end_at

    validates :started_at, presence: true, allow_nil: true

    validates :check_in_required, presence: true, inclusion: { in: [true, false] }
    # validates :check_in_start_at, presence: true, if: -> { check_in_required? }

    validates :registration_end_at, presence: true, allow_nil: true, if: -> { late_registration == false }
    validates :late_registration, presence: true, inclusion: { in: [true, false] }

    before_save :ready_to_start?, if: -> { saved_change_to_started_at?(from: nil) }

    has_many :players, class_name: 'Tournament::Player', dependent: :destroy_async
    validates :player_cap, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

    def ready_to_start?
      return false if phases.empty?
      return false if players.empty? || players.count < MINIMUM_PLAYER_COUNT

      phases.order(order: :asc).first.valid?
    end

    def start_tournament! # rubocop:disable Metrics/AbcSize
      cannot_start = 'Cannot start tournament.'
      raise "The tournament has no phases. #{cannot_start}" if phases.empty?
      raise "The tournament has no players. #{cannot_start}" if players.empty?
      raise "The tournament does not have the minimum required number of players. #{cannot_start}" if players.count < MINIMUM_PLAYER_COUNT

      update!(started_at: Time.current.utc)

      # Assuming the first phase can accept players, you might have something like this:
      first_phase = phases.order(order: :asc).first
      first_phase.accept_players(players:)
    end

    def open_for_registration?
      return false if registration_start_at.nil?
      return false unless after_registration_start?
      return false unless before_registration_end?
      return false if player_cap_reached?

      true
    end

    def register!(player:)
      return if player_cap.blank?

      if players.count < player_cap
        player.tournament_id = id
        players << player
        save!
      else
        errors.add(:players, 'have reached the player cap.')
        raise ActiveRecord::RecordInvalid, self
      end
    end

    def add_phase(phase:)
      phases << phase
      save
    end

    def add_phase!(phase:)
      phases << phase
      save!
    end

    private

    def player_cap_reached?
      player_cap.present? && players.count >= player_cap
    end

    def after_registration_start?
      registration_start_at <= Time.current.utc
    end

    def before_registration_end?
      registration_end_at.blank? || registration_end_at >= Time.current.utc
    end
  end
end
