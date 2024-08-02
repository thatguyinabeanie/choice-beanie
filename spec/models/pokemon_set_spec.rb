require 'rails_helper'

RSpec.describe PokemonSet do
  describe 'associations' do
    it { is_expected.to belong_to(:pokemon_team).class_name('PokemonTeam').inverse_of(:pokemon_sets) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:pokemon_team_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:ability) }
    it { is_expected.to validate_presence_of(:tera_type) }
    it { is_expected.to validate_presence_of(:nature) }
    it { is_expected.to validate_presence_of(:held_item) }
    it { is_expected.to validate_presence_of(:move1) }
    it { is_expected.to validate_presence_of(:move2) }
    it { is_expected.to validate_presence_of(:move3) }
    it { is_expected.to validate_presence_of(:move4) }
  end
end
