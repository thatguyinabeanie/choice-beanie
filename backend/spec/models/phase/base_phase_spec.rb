require 'rails_helper'

# Define a temporary subclass of Phase::BasePhase for testing purposes
class Phase::Test < Phase::BasePhase
  self.table_name = 'phases'
  before_validation :set_defaults

  def set_defaults
    self.type = 'Phase::Test'
    self.number_of_rounds ||= 5
    self.criteria ||= 'this is a criteria'
    self.name = 'BassFace'
  end
end

RSpec.describe Phase::BasePhase do
  describe 'associations' do
    subject { Phase::Test.new }

    it { is_expected.to have_many(:rounds).class_name('Tournament::Round').inverse_of(:phase).dependent(:destroy) }
    it { is_expected.to belong_to(:tournament).class_name('Tournament::Tournament') }
  end

  describe 'table name' do
    it "is 'phases'" do
      expect(described_class.table_name).to eq('phases')
    end
  end

  describe 'abstract class' do
    it 'is true' do
      expect(described_class.abstract_class).to be true
    end
  end

  describe 'validations' do
    subject { Phase::Test.new }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:best_of).is_greater_than(0).only_integer }
  end

  describe 'additional validation' do
    subject(:phase) { Phase::Test.new(best_of:, tournament:, name: 'BassFace', type: 'TestPhase') }

    let(:tournament) { create(:tournament) }

    context 'when best_of is odd' do
      let(:best_of) { 5 }

      it { is_expected.to be_valid }
    end

    context 'when best_of is even' do
      let(:best_of) { 6 }

      it 'is invalid' do
        phase.valid?
        expect(phase).not_to be_valid
      end

      it 'adds an error to best_of' do
        phase.valid?
        expect(phase.errors[:best_of]).to include(I18n.t('errors.phase.best_of_must_be_odd'))
      end
    end
  end

  describe '#accept_players' do
    let(:tournament){ create(:tournament) }
    let(:phase) { Phase::Test.create(tournament: tournament) }
    let(:players) { create_list(:player, 5) }

    it 'sets the players' do
      phase.accept_players(players:)
      expect(phase.players).to match_array(players)
    end
  end
end
