# typed: true

class Game < ApplicationRecord
  validates :name, presence: true
  has_many :formats, class_name: 'Tournament::Format', dependent: :destroy_async
  has_many :tournaments, class_name: 'Tournament::Tournament', dependent: :destroy_async
end
