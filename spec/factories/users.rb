FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username(specifier: 8..16) } # Generates a unique username with a length between 8 and 16 characters
    first_name { 'Fuecoco' }
    last_name { 'Supremacy' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
