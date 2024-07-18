require 'rails_helper'

RSpec.describe Phase::Base do
  describe 'associations' do
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
