require 'rails_helper'

RSpec.describe Tournament::Tournament, type: :model do
  let(:organization) { create(:organization) }
  let(:game) { create(:game) }
  let(:format) { create(:format, game:) }

  describe 'validations' do
    before do
      subject.organization = organization
      subject.game = game
      subject.format = format
    end

    it { should validate_uniqueness_of(:name).scoped_to(:organization_id).with_message(I18n.t('tournament.errors.validations.unique_per_org_name_start_at')) }
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:late_registration) }
    it { should validate_numericality_of(:player_cap).only_integer.is_greater_than(0).allow_nil }

    context 'when game is present' do
      before { subject.game = game }
      it { should validate_presence_of(:format) }
    end

    context 'when game is not present' do
      before { subject.game = nil }
      it { should_not validate_presence_of(:format) }
    end

    context 'when late_registration is true' do
      before { subject.late_registration = true }
      it { should_not validate_presence_of(:registration_end_at) }
    end

    context 'when start_at is present' do
      before do
        subject.start_at = Time.current
        allow(subject).to receive(:set_defaults)
      end
      it { should validate_presence_of(:check_in_start_at) }
    end

    context 'when start_at is not present' do
      before { subject.start_at = nil }
      it { should_not validate_presence_of(:check_in_start_at) }
    end
  end

  describe 'associations' do
    it { should belong_to(:organization).class_name('Organization') }
    it { should belong_to(:game).class_name('Game') }
    it { should belong_to(:format).class_name('Tournament::Format') }
    it { should have_many(:phases).class_name('Phase::BasePhase').dependent(:destroy_async) }
    it { should have_many(:players).class_name('Tournament::Player').dependent(:destroy_async) }
  end

  describe '#ready_to_start?' do
    let(:tournament) { create(:tournament) do |tournament| tournament.phases << create(:swiss_phase, tournament:) end }

    context 'when the tournament is not ready to start' do
      it 'returns false' do
        expect(tournament.ready_to_start?).to be false
      end
    end

    context 'when the tournament is ready to start' do
      let(:pokemon_team) { create(:pokemon_team) }
      let(:num_of_checked_in_players) { 5 }
      let(:players_checked_in) do
        create_list(:player_checked_in, num_of_checked_in_players, tournament: tournament)
      end

      let(:num_of_players_with_teams) { 5 }
      let(:players_with_teams) {create_list(:player_with_team, num_of_players_with_teams, tournament: tournament)}

      it 'returns true' do
        players_with_teams.sample(2).each do |player| player.check_in! end
        players_checked_in.sample(2).each do |player| player.submit_team!(pokemon_team:) end

        expect(tournament.ready_to_start?).to be true
      end
    end
  end

  describe '#start_tournament!' do

  end
end
