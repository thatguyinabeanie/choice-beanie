module Helpers
  module Match
    module OpponentFor
      def opponent_for(player)
        player == player1 ? player2 : player1
      end
    end
  end
end
