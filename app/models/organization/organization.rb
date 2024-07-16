# typed: true

module Organization
  class Organization < ApplicationRecord
    self.table_name = 'organizations'
    belongs_to :user
    has_many :organization_staff, class_name: 'Staff' # Define the direct association
    has_many :staff, through: :organization_staff, source: :user
    has_many :tournaments, through: :organization_tournaments
    validates :name, presence: true
  end
end
