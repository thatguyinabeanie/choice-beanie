require 'rails_helper'

# Define a temporary subclass of Phase::BasePhase for testing purposes
class TestPhase < Phase::BasePhase
  self.table_name = 'phases'
end

RSpec.describe Phase::BasePhase do
  describe 'associations' do
    subject { TestPhase.new }

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
end
