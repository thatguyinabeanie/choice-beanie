FactoryBot.define do
  factory :player, aliases: [:tournament_player], class: 'Tournament::Player' do
    user factory: :user
    tournament factory: :tournament
  end
end
