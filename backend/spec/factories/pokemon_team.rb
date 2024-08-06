FactoryBot.define do
  factory :pokemon_team, class: 'PokemonTeam' do
    user { nil }
    pokemon {[]}
  end
end
