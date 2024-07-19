# Assuming you have factories for tournament, player, and round defined elsewhere
FactoryBot.define do
  factory :match, class: 'Tournament::Match' do
    tournament # This assumes you have a factory named :tournament

    player1 { FactoryBot.create(:user) } # Adjust :player to your player factory name
    player2 { FactoryBot.create(:user) } # Adjust :player to your player factory name

    winner { player1 }
    round factory: :swiss_round
    table_number { 1 }
  end
end
