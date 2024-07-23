require 'rails_helper'

RSpec.describe Tournament::Tournament do
  let(:name) { 'Battle Stadium #1' }
  let(:organization) { create(:organization) }
  let(:game) { create(:game) }
  let(:format) { create(:format, game:) }
  let(:start_date) do
    Time.use_zone('Central Time (US & Canada)') do
      return Time.zone.parse('2007-07-07 12:00 PM').utc
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:organization).class_name('Organization::Organization') }
    it { is_expected.to belong_to(:game).class_name('Game') }
    it { is_expected.to belong_to(:format).class_name('Tournament::Format') }
    it { is_expected.to have_many(:phases).class_name('Phase::BasePhase').dependent(:destroy_async) }
    it { is_expected.to have_many(:players).class_name('Tournament::Player').dependent(:destroy_async) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      tournament = described_class.new(name:, start_date:, organization:, game:, format:)
      expect(tournament).to be_valid
    end

    it 'is not valid without a name' do
      tournament = described_class.new(start_date:, organization:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a start_date' do
      tournament = described_class.new(name:, organization:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without an organization' do
      tournament = described_class.new(name:, start_date:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a game' do
      tournament = described_class.new(name:, start_date:, organization:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a format' do
      tournament = described_class.new(name:, start_date:, organization:, game:)
      expect(tournament).not_to be_valid
    end
  end

  describe 'registration' do
    let(:tournament) { create(:tournament, registration_start_time:, registration_end_time:, player_cap: 2) }
    let(:registration_end_time) { nil }
    let(:registration_start_time) { nil }

    context 'when registration start time is nil' do
      it 'returns false' do
        expect(tournament).not_to be_open_for_registration
      end
    end

    context 'when registration start time is in the past' do
      let(:registration_start_time) { Time.current.utc - 1.day }

      context 'when registration end time is nil' do
        it 'returns true' do
          expect(tournament).to be_open_for_registration
        end
      end

      context 'when current time is before registration end time' do
        let(:registration_end_time) { Time.current.utc + 1.day }

        it 'returns true' do
          expect(tournament).to be_open_for_registration
        end
      end

      context 'when current time is after registration end time' do
        let(:registration_end_time) { Time.current.utc - 1.day }

        it 'returns false' do
          expect(tournament).not_to be_open_for_registration
        end
      end
    end

    context 'when registration start time is in the future' do
      let(:registration_start_time) { Time.current.utc + 1.day }

      it 'returns false' do
        expect(tournament).not_to be_open_for_registration
      end
    end

    context 'when player cap is present' do
      let(:registration_start_time) { Time.current.utc - 1.day }

      context 'when registrations count is less than player cap' do
        it 'returns true' do
          player = build(:tournament_player, tournament:, user: create(:user))
          tournament.register!(player:)
          expect(tournament).to be_open_for_registration
        end
      end

      context 'when registrations count is equal to player cap' do
        it 'returns false' do
          create(:player, tournament:)
          create(:player, tournament:)
          expect(tournament).not_to be_open_for_registration
        end
      end

      context 'when trying to add registration after player cap is reached' do
        it 'raises an error' do
          tour = tournament
          create(:player, tournament:)
          create(:player, tournament:)

          player = build(:tournament_player, tournament: tour)
          expect { tournament.register!(player:) }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Players have reached the player cap.')
        end
      end
    end
  end

  describe 'ready_to_start?' do
    let(:tournament) { create(:tournament) }

    context 'when phases are empty' do
      it 'returns false' do
        expect(tournament).not_to be_ready_to_start
      end
    end

    context 'when phases are present' do
      let(:phase) { create(:swiss_phase, tournament:) }

      context 'when first phase is valid' do
        it 'returns true' do
          tournament.players = create_list(:player, 5)
          tournament.phases << phase
          tournament.save!
          expect(tournament).to be_ready_to_start
        end
      end

      context 'when first phase is invalid' do
        it 'returns false' do # rubocop:disable RSpec/MultipleExpectations
          phase.update_columns(number_of_rounds: -1) # rubocop:disable Rails/SkipsModelValidations
          expect(phase).not_to be_valid
          expect(tournament).not_to be_ready_to_start
        end
      end
    end
  end

  describe 'start_tournament!' do
    let(:tournament) { create(:tournament, actual_start_time: nil) }

    it 'updates actual_start_time' do # rubocop:disable RSpec/ExampleLength
      current_time = Time.current
      allow(Time).to receive(:current).and_return(current_time)

      create(:swiss_phase, tournament:)
      create(:player, tournament:)
      expect { tournament.start_tournament! }
        .to change { tournament.reload.actual_start_time }
        .from(nil)
        .to be_within(1.second).of(current_time.utc)
    end

    it 'raises error if there are no phases' do
      expect { tournament.start_tournament! }
        .to raise_error("Tournament #{tournament.id} has no phases. Cannot start tournament.")
    end

    it 'raises error if there are no players' do
      create(:swiss_phase, tournament:)
      expect { tournament.start_tournament! }
        .to raise_error("Tournament #{tournament.id} has no players. Cannot start tournament.")
    end
  end
end
