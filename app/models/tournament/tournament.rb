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

    def registration_open?
      return false if registration_start_time.nil?

      current_time = Time.current.utc
      after_reg_start = registration_start_time <= current_time
      return after_reg_start && current_time <= registration_end_time if registration_end_time.present?

      after_reg_start
    end

    def add_registration!(registration:)
      raise 'Registration is closed' unless registration_open?

      registrations << registration
      save!
    end
  end
end
