require 'rails_helper'

RSpec.describe Tournament::Player do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:tournament).class_name('Tournament::Tournament').inverse_of(:players) }
    it { is_expected.to have_many(:phase_players).class_name('Tournament::PhasePlayer').dependent(:destroy).inverse_of(:player) }
    it { is_expected.to have_many(:phases).through(:phase_players).source(:phase) }
    it { is_expected.to have_many(:pokemon_sets).dependent(:destroy).class_name('Tournament::PokemonSet').inverse_of(:player) }
    it { is_expected.to accept_nested_attributes_for(:pokemon_sets) }
  end

  describe 'validations' do
    subject { create(:player) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:tournament_id) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:tournament_id).with_message(I18n.t('tournament.registration.already_registered')) }
  end

  describe 'methods' do
    let(:player) { create(:player) }

    it 'adds a pokemon set' do
      pokemon_set = create(:pokemon_set)
      player.add_pokemon_set!(pokemon_set)
      expect(player.pokemon_sets).to include(pokemon_set)
    end

    it 'adds multiple pokemon sets' do
      pokemon_sets = create_list(:pokemon_set, 2)
      player.add_pokemon_sets(pokemon_sets)
      expect(player.pokemon_sets).to include(*pokemon_sets)
    end

    it 'raises an error when adding an empty pokemon set' do
      expect { player.add_pokemon_set!(nil) }.to raise_error('Cannot add an empty Pokemon set.')
    end

    it 'adds pokemon sets and save' do
      pokemon_sets = create_list(:pokemon_set, 2)
      allow(player).to receive(:save!).and_call_original
      player.add_pokemon_sets!(pokemon_sets)
      expect(player.pokemon_sets).to include(*pokemon_sets)
    end

    it 'validates the count of pokemon sets' do
      pokemon_sets = create_list(:pokemon_set, 7)
      expect { player.add_pokemon_sets!(pokemon_sets) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Pokemon sets #{I18n.t('tournament.registration.too_many_pokemon')}")
    end
  end
end
