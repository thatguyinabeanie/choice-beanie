require 'rails_helper'

RSpec.describe Tournament::Match do
  let(:match_hash) do
    player_one = create(:user)
    player_two = create(:user)
    organization = create(:organization)
    organization.staff << create(:user)
    tournament = create(:tournament, organization:)
    phase = create(:swiss_phase, tournament:)
    round = create(:round, phase:)
    match = create(:match, round:, player_one:, player_two:)
    match_game = create(:match_game, match:)
    { match_game:, tournament:, organization:, match:, phase:, round:, player_one: match.player_one, player_two: match.player_two,
      staff_member: organization.staff.first }
  end

  let(:match) { match_hash[:match] }
  let(:player_one) { match_hash[:player_one] }
  let(:player_two) { match_hash[:player_two] }

  describe 'associations' do
    it { is_expected.to belong_to(:round).class_name('Tournament::Round') }
    it { is_expected.to belong_to(:player_one).class_name('User') }
    it { is_expected.to belong_to(:player_two).class_name('User') }
    # Add other associations here
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(match).to be_valid
    end

    it 'is not valid without a round' do
      match.round = nil
      expect(match).not_to be_valid
    end

    # Add other validations here
  end

  describe 'custom methods' do
    # Example: Testing a method that determines the winner
    describe '#report_winner!' do
      it 'correctly identifies the winner' do
        # Assuming there's a method to set a match's outcome
        match.report_winner!(player: player_one, reporter: player_one)
        expect(match.winner).to eq(player_one)
      end

      it 'correctly identifies the loser' do
        match.report_winner!(player: player_one, reporter: player_one)
        expect(match.loser).to eq(player_two)
      end
    end

    # Add tests for other custom methods here
  end
end
