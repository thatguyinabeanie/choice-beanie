FactoryBot.define do
  factory :tournament, class: 'Tournament::Tournament' do
    sequence(:name) { |n| "#{organization.name} #{game.name} #{format.name} Tournament ##{n}" }
    organization factory: :organization
    game factory: :game
    format { create(:format, game:) }

    start_at   { 1.hour.from_now }
    started_at { start_at + 2.minutes }

    end_at { start_at + 1.day }
    ended_at { end_at - 2.minutes }

    registration_start_at { start_at - 1.week }
    registration_end_at { start_at }

    check_in_start_at { start_at - 2.hour }
  end
end
