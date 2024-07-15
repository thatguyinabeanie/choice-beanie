class OrganizerStaff < ApplicationRecord
  belongs_to :organizer
  belongs_to :user
end
