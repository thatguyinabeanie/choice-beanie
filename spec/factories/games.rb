FactoryBot.define do
  factory :game, class: 'Game' do
    name { Faker::Game.title }
    formats { [] }
  end
end
