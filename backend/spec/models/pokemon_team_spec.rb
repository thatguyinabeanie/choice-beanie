require 'rails_helper'

RSpec.describe PokemonTeam do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:pokemon).class_name('Pokemon').inverse_of(:pokemon_team).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'custom validations' do
    it 'validates the number of pokemon' do
      pokemon_team = described_class.new
      pokemon_team.pokemon = build_list(:pokemon, 7)
      expect(pokemon_team).not_to be_valid
    end

    it 'returns an error when number of pokemon is not valid' do
      pokemon_team = described_class.new
      pokemon_team.pokemon = build_list(:pokemon, 7)
      pokemon_team.valid?
      expect(pokemon_team.errors[:pokemon]).to include('Too many Pokemon.')
    end
  end
end
