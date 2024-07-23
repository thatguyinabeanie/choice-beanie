FactoryBot.define do
  factory :pokemon_set, class: 'Tournament::PokemonSet' do
    name { 'Skeledirge' }
    ability { 'Unaware' }
    nature { 'Modest' }
    tera_type { 'Grass' }
    held_item { 'Leftovers' }

    move1 { 'Torch Song' }
    move2 { 'Shadow Ball' }
    move3 { 'Slack Off' }
    move4 { 'Protect' }

    player factory: :player
  end
end
