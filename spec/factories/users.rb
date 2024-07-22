FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    # Generates a unique username with a length between 8 and 16 characters
    username { Faker::Internet.unique.username(specifier: 5..16) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password {  Faker::Internet.password }
    password_confirmation { password }
    pronouns { 'they/them' }
  end
end
