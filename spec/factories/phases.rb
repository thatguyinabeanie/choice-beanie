FactoryBot.define do
  factory :phase do
    tournament { nil }
    phase_type { 'MyString' }
    number_of_rounds { 1 }
    criteria { 'MyString' }
  end
end
