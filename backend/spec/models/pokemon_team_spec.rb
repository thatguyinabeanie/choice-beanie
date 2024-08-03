require 'rails_helper'

RSpec.describe PokemonTeam do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:pokemon_sets).class_name('PokemonSet').inverse_of(:pokemon_team).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'custom validations' do
    it 'validates the number of pokemon sets' do
      pokemon_team = described_class.new
      pokemon_team.pokemon_sets = build_list(:pokemon_set, 7)
      expect(pokemon_team).not_to be_valid
    end

    it 'returns an error when number of pokemon is not valid' do
      pokemon_team = described_class.new
      pokemon_team.pokemon_sets = build_list(:pokemon_set, 7)
      pokemon_team.valid?
      expect(pokemon_team.errors[:pokemon_sets]).to include('Too many Pokemon.')
    end
  end
end
