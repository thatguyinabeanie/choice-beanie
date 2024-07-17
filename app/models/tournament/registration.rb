module Tournament
  class Registration < ApplicationRecord
    belongs_to :user
    belongs_to :tournament
  end
end
