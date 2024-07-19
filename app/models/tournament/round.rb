module Tournament
  class Round < ApplicationRecord
    self.table_name = 'rounds'
    belongs_to :phase, class_name: 'Phase::Base'
    has_many :matches, dependent: :destroy
  end
end
