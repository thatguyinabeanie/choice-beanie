# typed: true

module Tournament
  class Format < ApplicationRecord
    belongs_to :game, class_name: 'Game'
    validates :name, presence: true, uniqueness: { scope: :game_id }, length: { maximum: 255 }
    validates :game, presence: true
  end
end
