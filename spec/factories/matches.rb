FactoryBot.define do
  factory :match do
    tournament { nil }
    round { 1 }
    player1 { nil }
    player2 { nil }
    winner { nil }
  end
end
