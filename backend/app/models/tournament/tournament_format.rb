# this is a join table and it is not necessary to test it
module Tournament
  class TournamentFormat < ApplicationRecord
    belongs_to :format, class_name: 'Tournament::Format'
    belongs_to :tournament, class_name: 'Tournament::Tournament'
  end
end
