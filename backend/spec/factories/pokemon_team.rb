FactoryBot.define do
  factory :pokemon_team, class: 'PokemonTeam' do
    user { nil }
    pokemon_sets { build_list(:pokemon_set, 6) }
  end
end
