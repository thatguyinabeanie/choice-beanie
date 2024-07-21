FactoryBot.define do
  factory :phase, class: 'Phase::Base' do
    name { 'Epic Swiss Rounds' }
    tournament factory: :tournament
    type { 'Phase::Base' }
    number_of_rounds { 5 }
    criteria { 'this is a criteria' }

    # Define specific factories that inherit from the abstract phase
    factory :swiss_phase, class: 'Phase::Swiss' do
      name { 'Epic Swiss Rounds' }
      type { 'Phase::Swiss' }
      number_of_rounds { 5 }
      criteria { 'this is a criteria for swiss phase' }
    end

    factory :elimination_phase, class: 'Phase::SingleEliminationBracket' do
      name { 'Intense Single Elimination' }
      type { 'Phase::SingleEliminationBracket' }
      number_of_rounds { 3 }
      criteria { 'this is a criteria for elimination phase' }
    end
  end
end
