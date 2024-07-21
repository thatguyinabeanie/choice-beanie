FactoryBot.define do
  factory :match_game, class: 'Tournament::MatchGame' do
    # Define the attributes for the match_game factory
    # For example:
    player1 { FactoryBot.create(:player) }
    player2 { FactoryBot.create(:player) }
    winner { nil }
    loser { nil }
    game_number { 1 }
  end
end
