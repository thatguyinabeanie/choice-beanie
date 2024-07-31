# typed: true

class Game < ApplicationRecord
  # extend FriendlyId
  # friendly_id :name, use: :slugged
  validates :name, presence: true
  has_many :formats, class_name: 'Tournament::Format', dependent: :nullify
  has_many :tournaments, class_name: 'Tournament::Tournament', dependent: :nullify
end
