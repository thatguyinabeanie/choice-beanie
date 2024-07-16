# app/models/organizer_staff.rb
module Organization
  class Staff < ApplicationRecord
    self.table_name = 'organization_staff'
    belongs_to :organization
    belongs_to :user
  end
end
