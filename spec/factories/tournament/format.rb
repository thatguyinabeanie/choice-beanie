FactoryBot.define do
  factory :format, class: 'Tournament::Format' do
    name { "Regulation #{Faker::Number.unique.number(digits: 4)}" }
    game { nil }
  end
end
