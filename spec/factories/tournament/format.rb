FactoryBot.define do
  factory :format, class: 'Tournament::Format' do
    name { 'Regulation G' }
    game
  end
end
