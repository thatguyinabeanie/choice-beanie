module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    belongs_to :game, class_name: 'Game'
    belongs_to :format, class_name: 'Tournament::Format'

    has_many :phases, class_name: 'Phase::BasePhase', dependent: :destroy_async
    has_many :registrations, class_name: 'Tournament::Registration', dependent: :destroy_async

    validates :name, presence: true
    validates :start_date, presence: true
    validates :format, presence: true
    validates :game, presence: true
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_date], message: I18n.t('tournament.errors.validations.unique_per_org_name_start_date') }

    validates :player_cap, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

    def player_cap_reached?
      player_cap.present? && registrations.count >= player_cap
    end

    def after_registration_start?
      registration_start_time <= Time.current.utc
    end

    def before_registration_end?
      registration_end_time.blank? || registration_end_time >= Time.current.utc
    end

    def open_for_registration?
      return false if registration_start_time.nil?
      return false unless after_registration_start?
      return false unless before_registration_end?
      return false if player_cap_reached?

      true
    end

    def add_registration!(registration:)
      if player_cap.present? && registrations.count < player_cap
        registrations << registration
        save!
      else
        errors.add(:registrations, 'Tournament is at capacity.')
        raise ActiveRecord::RecordInvalid.new(self)
      end
    end
  end
end
