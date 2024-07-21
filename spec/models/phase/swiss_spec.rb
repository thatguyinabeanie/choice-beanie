require 'rails_helper'

RSpec.describe Phase::Swiss do
  describe 'table_name' do
    it 'returns the correct table name' do
      expect(described_class.table_name).to eq('phases')
    end
  end

  describe 'inheritance' do
    it 'inherits from Phase::BasePhase' do
      expect(described_class.superclass).to eq(Phase::BasePhase)
    end
  end

  describe 'create' do
    it 'successfully creates a swiss phase' do
      tournament = create(:tournament) # Assuming a :tournament factory exists
      swiss_phase = create(:swiss_phase, tournament:)
      expect(swiss_phase.persisted?).to be true
    end
  end

  # describe 'associations' do
  #   it 'has_many :matches' do
  #     expect(described_class.reflect_on_association(:matches).macro).to eq(:has_many)
  #   end
  # end

  describe 'validations' do
    it 'validates presence of :name' do
      expect(described_class.new).to validate_presence_of(:name)
    end
  end
end
