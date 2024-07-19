FactoryBot.define do
  factory :tournament, class: 'Tournament::Tournament' do
    name { 'Beanie Brawl #69420' }
    start_date { '2024-07-10 03:55:12' }
    ended_at { '2024-07-11 03:55:12' }
    organization
    game
    format
  end
end
