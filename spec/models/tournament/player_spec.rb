require 'rails_helper'

RSpec.describe Tournament::Player do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:tournament).class_name('Tournament::Tournament').inverse_of(:players) }
    it { is_expected.to belong_to(:pokemon_team).class_name('PokemonTeam').optional(true) }
  end

  describe 'validations' do
    subject { create(:tournament_player) }

    it { is_expected.to validate_presence_of(:user_id) }

    it { is_expected.to validate_presence_of(:tournament_id) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:tournament_id).with_message(I18n.t('tournament.registration.already_registered')) }

    it { is_expected.to validate_presence_of(:in_game_name) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:pokemon_team) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:username).to(:user) }
  end

  describe '#checked_in?' do
    it 'returns true if checked_in_at is present' do
      player = described_class.new(checked_in_at: Time.current)
      expect(player.checked_in?).to be true
    end

    it 'returns false if checked_in_at is not present' do
      player = described_class.new
      expect(player.checked_in?).to be false
    end
  end
end
