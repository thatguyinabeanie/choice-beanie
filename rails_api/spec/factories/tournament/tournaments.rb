FactoryBot.define do
  factory :tournament, class: 'Tournament::Tournament' do
    name { 'Beanie Brawl #69420' }
    start_at   { '2024-07-10 03:00:00' }
    started_at { '2024-07-10 03:05:07' }

    end_at { '2024-07-11 12:54:12' }
    ended_at { '2024-07-11 12:54:12' }

    registration_start_at { '2024-07-01 02:00:00' }
    registration_end_at { start_at }

    check_in_start_at { '2024-07-10 02:00:00' }

    organization factory: :organization
    game factory: :game
    format { create(:format, game:) }
  end
end
