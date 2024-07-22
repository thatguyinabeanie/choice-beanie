module Helpers
  module Match
    module OpponentFor
      def opponent_for(player)
        player == player_one ? player_two : player_one
      end
    end
  end
end
