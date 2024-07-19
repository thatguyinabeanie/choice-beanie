module Organization
  class Membership < ApplicationRecord
    self.table_name = 'organization_memberships'
    belongs_to :organization
    belongs_to :user
  end
end
