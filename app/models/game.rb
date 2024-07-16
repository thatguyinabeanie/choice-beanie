# typed: true

class Game < ApplicationRecord
  validates :name, presence: true
  has_many :tournament_formats, class_name: 'Tournament::Format', dependent: :destroy
end
