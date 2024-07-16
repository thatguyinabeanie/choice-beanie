# typed: true

class Game < ApplicationRecord
  validates :name, presence: true
end
