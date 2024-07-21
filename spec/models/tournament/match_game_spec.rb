require 'rails_helper'

RSpec.describe Tournament::MatchGame do
  describe 'associations' do
    it { is_expected.to belong_to(:match).class_name('Tournament::Match') }
    it { is_expected.to belong_to(:winner).class_name('User').optional }
    it { is_expected.to belong_to(:loser).class_name('User').optional }
    it { is_expected.to belong_to(:reporter).class_name('User').optional }
    it { is_expected.to delegate_method(:player1).to(:match) }
    it { is_expected.to delegate_method(:player2).to(:match) }
  end

  describe 'validations' do
    # it { is_expected.to validate_presence_of(:winner).on(:report_game) }
    # it { is_expected.to validate_presence_of(:loser).on(:report_game) }
    # it { is_expected.to validate_presence_of(:reporter).on(:report_game) }

    it 'validates that winner and loser cannot be the same' do
      match_game = build(:match_game, winner: user, loser: user)
      match_game.valid?(:report_game)
      expect(match_game.errors[:base]).to include('Winner and loser cannot be the same')
    end

    it 'validates that winner and loser must be either player 1 or player 2' do
      match_game = build(:match_game, winner: user, loser: other_user)
      match_game.valid?(:report_game)
      expect(match_game.errors[:base]).to include('Winner and loser must be either player 1 or player 2')
    end
  end

  describe 'reporting match game' do
    let(:player1) { create(:player) } # rubocop:disable RSpec/IndexedLet
    let(:player2) { create(:player) } # rubocop:disable RSpec/IndexedLet
    let(:phase) { create(:swiss_phase) }
    let(:round) { create(:round, phase:) }
    let(:match) { create(:match, player1:, player2:, round:) }
    let(:match_game) { create(:match_game, match:) }
    let(:reporter) { create(:user) }

    it 'sets the winner, loser, reporter, and report_submitted_at attributes' do
      match_game.report_game(winner_id: player1, loser_id: player2, reporter_id: reporter.id)
      expect(match_game.winner).to eq(winner)
      expect(match_game.loser).to eq(loser)
      expect(match_game.reporter).to eq(reporter)
      expect(match_game.report_submitted_at).to be_within(1.second).of(Time.current.utc)
    end

    it 'saves the match game' do
      expect { match_game.report_game(winner_id: winner.id, loser_id: loser.id, reporter_id: reporter.id) }.to change(described_class, :count).by(1)
    end
  end
end
