require 'rails_helper'

RSpec.describe Tournament::Tournament do
  let(:organization) { create(:organization) }
  let(:game) { create(:game) }
  let(:format) { create(:format, game:) }

  describe 'validations' do
    subject(:tournament) { build(:tournament) }

    before do
      tournament.organization = organization
      tournament.game = game
      tournament.format = format
    end

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:organization_id).with_message(I18n.t('tournament.errors.validations.unique_per_org_name_start_at')) }
    it { is_expected.to validate_presence_of(:organization) }
    it { is_expected.to validate_presence_of(:game) }
    it { is_expected.to validate_presence_of(:late_registration) }
    it { is_expected.to validate_numericality_of(:player_cap).only_integer.is_greater_than(0).allow_nil }

    context 'when game is present' do
      before { tournament.game = game }

      it { is_expected.to validate_presence_of(:format) }
    end

    context 'when game is not present' do
      before { tournament.game = nil }

      it { is_expected.not_to validate_presence_of(:format) }
    end

    context 'when late_registration is true' do
      before { tournament.late_registration = true }

      it { is_expected.not_to validate_presence_of(:registration_end_at) }
    end

    context 'when start_at is present' do
      before do
        tournament.start_at = Time.current
        # allow(tournament).to receive(:set_defaults)
      end

      # todo: uncomment and implement
      # it { is_expected.to validate_presence_of(:check_in_start_at) }
    end

    context 'when start_at is not present' do
      before { tournament.start_at = nil }

      it { is_expected.not_to validate_presence_of(:check_in_start_at) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:organization).class_name('Organization') }
    it { is_expected.to belong_to(:game).class_name('Game') }
    it { is_expected.to belong_to(:format).class_name('Tournament::Format') }
    it { is_expected.to have_many(:phases).class_name('Phase::BasePhase').dependent(:destroy_async) }
    it { is_expected.to have_many(:players).class_name('Tournament::Player').dependent(:destroy_async) }
  end

  describe '#ready_to_start?' do
    let(:tournament) do
      create(:tournament) do |tournament|
        tournament.phases << create(:swiss_phase, tournament:)
      end
    end

    context 'when the tournament is not ready to start' do
      it 'returns false' do
        expect(tournament.ready_to_start?).to be false
      end
    end

    context 'when the tournament is ready to start' do
      let(:pokemon_team) { create(:pokemon_team) }
      let(:num_of_checked_in_players) { 5 }
      let(:players_checked_in) do
        create_list(:player_checked_in, num_of_checked_in_players, tournament:)
      end

      let(:num_of_players_with_teams) { 5 }
      let(:players_with_teams) { create_list(:player_with_team, num_of_players_with_teams, tournament:) }

      it 'returns true' do
        players_with_teams.sample(2).each(&:check_in!)
        players_checked_in.sample(2).each do |player|
          player.submit_team!(pokemon_team:)
        end

        expect(tournament.ready_to_start?).to be true
      end
    end
  end

  describe '#start_tournament!' do
    context 'when the tournament is not ready to start' do
      let(:tournament) { create(:tournament, :with_phases) }

      it 'raises an error' do
        expect { tournament.start_tournament! }.to raise_error(RuntimeError)
      end
    end

    context 'when the tournament is ready to start' do
      let(:tournament) { create(:tournament, :with_phases, :with_players_with_team, :with_players_checked_in, :with_players_with_team_and_checked_in) }

      it 'starts the tournament' do
        expect { tournament.start_tournament! }.to change(tournament, :started_at).from(nil)
      end

      it 'accepts players into the first phase' do
        expect { tournament.start_tournament! }.to change { tournament.phases.first.players.count }.from(0).to(5)
      end

      it 'only accepts players into the first phase that are checked in and have submitted a team.' do
        tournament.start_tournament!
        eligible_players = tournament.players.checked_in_and_ready

        expect(eligible_players).to match_array(tournament.phases.first.players)
      end

      it 'does not accept players into the first phase if they are not checked in or have not submitted a team.' do
        tournament.start_tournament!
        not_eligible_players = tournament.players - tournament.players.checked_in_and_ready
        expect(not_eligible_players).not_to match_array(tournament.phases.first.players)
      end
    end
  end
end
