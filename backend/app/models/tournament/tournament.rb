module Tournament
  class Tournament < ApplicationRecord
    self.table_name = 'tournaments'
    MINIMUM_PLAYER_COUNT = 4
    # High level tournament information
    # validates :name, presence: true
    belongs_to :organization, class_name: 'Organization'
    belongs_to :game, class_name: 'Game'
    belongs_to :format, class_name: 'Tournament::Format'

    validates :name, uniqueness: { scope: :organization_id, message: I18n.t('tournament.errors.validations.unique_per_org_name_start_at') }

    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_at], message: I18n.t('tournament.errors.validations.unique_per_org_name_start_at') }
    validates :game, presence: true
    validates :format, presence: true, if: -> { game.present? }
    has_many :phases, class_name: 'Phase::BasePhase', dependent: :destroy_async

    # Tournament Logistics Information
    validates :registration_end_at, presence: true, allow_nil: true, if: -> { late_registration == false }
    validates :late_registration, presence: true, inclusion: { in: [true, false] }
    validates :check_in_start_at, presence: true, if: -> { start_at.present? }
    validate :check_in_start_at_before_start_at, if: -> { check_in_start_at.present? && start_at.present? }

    has_many :players, class_name: 'Tournament::Player', dependent: :destroy_async
    validates :player_cap, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

    before_save :ready_to_start?, if: -> { saved_change_to_started_at?(from: nil) }
    before_validation :set_defaults

    def ready_to_start?
      return false if phases.empty? || players.empty? || players.count < MINIMUM_PLAYER_COUNT

      phases.order(order: :asc).first.valid?
    end

    def check_in_start_at_before_start_at
      errors.add(:check_in_start_at, "must be before start_at") unless check_in_start_at < start_at
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

    def registration_open?
      return false if registration_start_at.blank?
      check_registration_window = Time.current.utc >= registration_start_at && self.started_at.blank?
      return  check_registration_window if player_cap.blank?
      players.count < player_cap && check_registration_window
    end

    def register_user!(user:)
      raise 'User is already registered for this tournament.' if players.exists?(user_id: user.id)
      raise 'Registration is closed.' unless registration_open?
      players.create!(user: user)
    end

    def register_user(user:)
      return false if players.exists?(user_id: user.id)
      return false unless registration_open?
      players.create(user: user)
    end

    def add_phase(phase:)
      phases << phase
      save
    end

    def add_phase!(phase:)
      phases << phase
      save!
    end

    def players_checked_in_and_ready
      players.checked_in_and_ready
    end

    private

    def set_defaults
      self.name ||= "#{organization.name}'s Tournament # #{organization.tournaments.count + 1}" if organization.present?

      self.format ||= game.formats.last if game.present?

      return if start_at.blank?
      self.registration_start_at ||= start_at - 1.week

      self.check_in_start_at ||= start_at - 1.hour
    end


  end
end
