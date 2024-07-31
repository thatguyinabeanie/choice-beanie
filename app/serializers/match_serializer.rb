class MatchSerializer < ActiveModel::Serializer
  attributes :id, :round_id, :tournament_id, :table_number, :player1_id, :player2_id
end

class MatchDetailSerializer < MatchSerializer
  attributes :id, :round_id, :tournament_id, :table_number, :player1_id, :player2_id, :winner_id, :loser_id, :player_one_check_in, :player_two_check_in, :created_at, :updated_at, :reported_at
end
