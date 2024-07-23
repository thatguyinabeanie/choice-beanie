module Tournament
  class Tournament < ApplicationRecord
    self.table_name = 'tournaments'
    MINIMUM_PLAYER_COUNT = 4
    belongs_to :organization, class_name: 'Organization::Organization'
    belongs_to :game, class_name: 'Game'
    belongs_to :format, class_name: 'Tournament::Format'

    has_many :phases, class_name: 'Phase::BasePhase', dependent: :destroy_async
    has_many :players, class_name: 'Tournament::Player', dependent: :destroy_async

    validates :name, presence: true
    validates :start_date, presence: true
    validates :format, presence: true
    validates :game, presence: true
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_date], message: I18n.t('tournament.errors.validations.unique_per_org_name_start_date') }

    validates :player_cap, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

    before_save :ready_to_start?, if: -> { saved_change_to_actual_start_time?(from: nil) }

    def ready_to_start?
      return false if phases.empty?
      return false if players.empty? || players.count < MINIMUM_PLAYER_COUNT

      phases.order(order: :asc).first.valid?
    end

    def start_tournament!
      raise "Tournament #{id} has no phases. Cannot start tournament." if phases.empty?
      raise "Tournament #{id} has no players. Cannot start tournament." if players.empty?

      update!(actual_start_time: Time.current.utc)

      # Assuming the first phase can accept players, you might have something like this:
      first_phase = phases.order(order: :asc).first
      first_phase.accept_players(players:)
    end

    def open_for_registration?
      return false if registration_start_time.nil?
      return false unless after_registration_start?
      return false unless before_registration_end?
      return false if player_cap_reached?

      true
    end

    def register!(player:)
      return if player_cap.blank?

      if players.count < player_cap
        players << player
        save!
      else
        errors.add(:players, 'have reached the player cap.')
        raise ActiveRecord::RecordInvalid, self
      end
    end

    private

    def player_cap_reached?
      player_cap.present? && players.count >= player_cap
    end

    def after_registration_start?
      registration_start_time <= Time.current.utc
    end

    def before_registration_end?
      registration_end_time.blank? || registration_end_time >= Time.current.utc
    end
  end
end
