# frozen_string_literal: true

# app/models/organizer_staff.rb
class OrganizerStaff < ApplicationRecord
  belongs_to :organizer
  belongs_to :user
end
