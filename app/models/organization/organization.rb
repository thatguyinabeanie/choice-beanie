# typed: true

module Organization
  class Organization < ApplicationRecord
    self.table_name = 'organizations'
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :owner, class_name: 'User', optional: false

    has_many :organization_tournaments, class_name: 'Organization::OrganizationTournament', dependent: :destroy
    has_many :tournaments, through: :organization_tournaments

    has_many :organization_memberships, class_name: 'Organization::Membership', dependent: :destroy
    has_many :staff, through: :organization_memberships, source: :user

    validates :name, presence: true
    validates :owner, presence: true
    validates :owner_id, uniqueness: true
  end
end
