FactoryBot.define do
  factory :organization, class: 'Organization::Organization' do
    name { "Totally Real Organization #{Faker::Company.unique.name}" }
    description { 'This is a very deep and meaningful description.' }
    owner factory: :user
  end
end
