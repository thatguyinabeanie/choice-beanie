module Tournament
  class Tournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    belongs_to :game, class_name: 'Game'
    belongs_to :format, class_name: 'Tournament::Format'

    has_many :phases, class_name: 'Phase::Base', dependent: :destroy_async
    has_many :registrations, class_name: 'Tournament::Registration', dependent: :destroy_async

    validates :name, presence: true
    validates :start_date, presence: true
    validates :format, presence: true
    validates :game, presence: true
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: %i[name start_date], message: I18n.t('tournament.errors.validations.unique_per_org_name_start_date') }
  end
end
