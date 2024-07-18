FactoryBot.define do
  factory :user do
    email { 'fuecoco_is_awesome@battle-stadium.gg' }
    username { 'fuecoco_is_awesome' }
    first_name { 'Fuecoco' }
    last_name { 'Supremacy' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
