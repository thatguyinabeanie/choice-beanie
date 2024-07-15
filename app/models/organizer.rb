# frozen_string_literal: true

class Organizer < ApplicationRecord
  belongs_to :user
  has_many :staff, through: :organizer_staffs, source: :user
end
