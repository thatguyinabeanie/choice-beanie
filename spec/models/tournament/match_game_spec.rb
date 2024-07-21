require 'rails_helper'

RSpec.describe Tournament::MatchGame do
  let(:tournament_hash) do
    organization = create(:organization)
    organization.staff << create(:user)
    tournament = create(:tournament, organization:)
    phase = create(:swiss_phase, tournament:)
    round = create(:round, phase:)
    match = create(:match, round:)
    match_game = create(:match_game, match:)
    { match_game:, tournament:, organization:, match:, phase:, round:, player1: match.player1, player2: match.player2, staff_member: organization.staff.first }
  end

  let(:match_game) { tournament_hash[:match_game] }
  let(:player1) { tournament_hash[:player1] } # rubocop:disable RSpec/IndexedLet
  let(:player2) { tournament_hash[:player2] } # rubocop:disable RSpec/IndexedLet

  describe 'associations' do
    it { is_expected.to belong_to(:match).class_name('Tournament::Match') }
    it { is_expected.to belong_to(:winner).class_name('User').optional }
    it { is_expected.to belong_to(:loser).class_name('User').optional }
    it { is_expected.to belong_to(:reporter).class_name('User').optional }
    it { is_expected.to delegate_method(:player1).to(:match) }
    it { is_expected.to delegate_method(:player2).to(:match) }
  end

  describe 'validations' do
    it 'validates that winner and loser cannot be the same' do
      match_game = build(:match_game, winner: player1, loser: player1)
      match_game.valid?(:report_game!)
      expect(match_game.errors[:base]).to include(I18n.t('errors.match_game.winner_and_loser_are_the_same'))
    end

    it 'validates that winner and loser must be either player 1 or player 2' do
      match_game = build(:match_game, winner: player1, loser: create(:user))
      match_game.valid?(:report_game!)
      expect(match_game.errors[:base]).to include(I18n.t('errors.match_game.loser_must_be_match_player'))
    end

    it 'does not add any errors when reporter is nil' do
      match_game.reporter = nil
      match_game.send(:reporter_role_validation)
      expect(match_game.errors).to be_empty
    end

    it 'does not add any errors when reporter is one of the players' do
      match_game.reporter = player1
      match_game.send(:reporter_role_validation)
      expect(match_game.errors).to be_empty
    end

    it 'does not add any errors when reporter is a staff member of the tournament organization' do
      match_game.reporter = tournament_hash[:organization].staff.first
      match_game.send(:reporter_role_validation)
      expect(match_game.errors).to be_empty
    end

    it 'adds an error when reporter is not a player or staff member' do
      match_game.reporter = create(:user)
      match_game.send(:reporter_role_validation)
      expect(match_game.errors[:base]).to include(I18n.t('errors.match_game.reporter_must_be_match_player_or_staff'))
    end
  end

  describe '#report_game!' do
    let(:staff_member) { tournament_hash[:staff_member] }

    it 'reports the game with the winner as the winner' do
      match_game.report_game!(winner: player1, loser: player2, reporter: staff_member)
      expect(match_game.winner).to eq(player1)
    end

    it 'reports the game with the loser as the loser' do
      match_game.report_game!(winner: player1, loser: player2, reporter: staff_member)
      expect(match_game.loser).to eq(player2)
    end

    it 'does not allow a third person to be the winner' do
      expect do
        match_game.report_game!(winner: player1, loser: create(:user), reporter: staff_member)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: #{I18n.t('errors.match_game.loser_must_be_match_player')}")
    end

    it 'does not allow a third person to be the loser' do
      expect do
        match_game.report_game!(winner: create(:user), loser: player2, reporter: staff_member)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: #{I18n.t('errors.match_game.winner_must_be_match_player')}")
    end

    it 'sets the reporter if the reporter is a tournament staff' do
      match_game.report_game!(winner: player1, loser: player2, reporter: staff_member)
      expect(match_game.reporter).to eq(staff_member)
    end

    it 'raises an error if the reporter is not a match player or staff member' do
      expect do
        match_game.report_game!(winner: player1, loser: player2, reporter: create(:user))
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: #{I18n.t('errors.match_game.reporter_must_be_match_player_or_staff')}")
    end

    it 'sets the reported_at attribute' do
      match_game.report_game!(winner: player1, loser: player2, reporter: staff_member)
      expect(match_game.reported_at).to be_within(10.seconds).of(Time.current.utc)
    end
  end
end