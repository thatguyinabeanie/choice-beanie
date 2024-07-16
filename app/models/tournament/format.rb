# typed: true

module Tournament
  class Format < ApplicationRecord
    self.table_name = 'formats'
    validates :name, presence: true
    belongs_to :game
  end
end
