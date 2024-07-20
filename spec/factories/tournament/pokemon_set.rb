FactoryBot.define do
  factory :pokemon_set do
    name { 'Skeledirge' }
    ability { 'Unaware' }
    nature { 'Unaware' }
    tera_type { 'Grass' }
    held_item { 'Leftovers' }

    move_1 { 'Torch Song' }
    move_2 { 'Shadow Ball' }
    move_3 { 'Slack Off' }
    move_4 { 'Protect' }

    registration
  end
end
