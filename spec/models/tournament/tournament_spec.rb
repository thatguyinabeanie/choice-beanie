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
    it { is_expected.to have_many(:registrations).class_name('Tournament::Registration').dependent(:destroy_async) }
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
          registration = build(:registration, tournament:, player: create(:user))
          tournament.add_registration!(registration:)
          expect(tournament).to be_open_for_registration
        end
      end

      context 'when registrations count is equal to player cap' do
        it 'returns false' do
          create(:registration, tournament:)
          create(:registration, tournament:)
          expect(tournament).not_to be_open_for_registration
        end
      end

      context 'when trying to add registration after player cap is reached' do
        it 'raises an error' do
          tour = tournament
          create(:registration, tournament:)
          create(:registration, tournament:)

          registration = build(:registration, tournament: tour)
          expect { tournament.add_registration!(registration:) }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Registrations Tournament is at capacity.')
        end
      end
    end
  end

  # describe 'add_registration!' do
  #   let(:tournament) { described_class.new(registration_start_time:, registration_end_time:) }

  #   context 'when registration is closed' do
  #     it 'raises an error' do
  #       registration = build(:registration)
  #       expect { tournament.add_registration!(registration:) }.to raise_error('Registration is closed')
  #     end
  #   end

  #   context 'when registration is open' do
  #     let(:registration) { build(:registration) }

  #     before do
  #       allow(tournament).to receive(:registration_open?).and_return(true)
  #     end

  #     it 'adds the registration' do
  #       tournament.add_registration!(registration:)
  #       expect(tournament.registrations).to contain_exactly(registration)
  #     end

  #     it 'saves the tournament' do
  #       expect(tournament).to receive(:save!)
  #       tournament.add_registration!(registration:)
  #     end
  #   end
  # end
end
