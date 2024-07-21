# Assuming you have factories for tournament, player, and round defined elsewhere
FactoryBot.define do
  factory :match, class: 'Tournament::Match' do
    round factory: :swiss_round
    table_number { 1 }

    player1 factory: :player
    player2 factory: :player

    player1_check_in { nil }
    player2_check_in { nil }

    winner { nil }
    loser { nil }
  end
end
