FactoryBot.define do
  factory :player, aliases: [:tournament_player], class: 'Tournament::Player' do
    user factory: :user
    tournament factory: :tournament
    in_game_name { Faker::Name.name }

    trait :with_team do
      pokemon_team factory: :pokemon_team
    end

    trait :checked_in do
      checked_in_at { Time.current.utc }
    end

    factory :player_checked_in, traits: [:checked_in]
    factory :player_with_team, traits: [:with_team]
    factory :player_with_team_checked_in, traits: [:with_team, :checked_in]
  end
end
