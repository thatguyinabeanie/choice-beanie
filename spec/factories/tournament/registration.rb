FactoryBot.define do
  factory :registration do
    player factory: :user
    tournament
  end
end
