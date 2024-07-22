FactoryBot.define do
  factory :registration, class: 'Tournament::Registration' do
    player factory: :user
    tournament factory: :tournament
  end
end
