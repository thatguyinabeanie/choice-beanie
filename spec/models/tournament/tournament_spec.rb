require 'rails_helper'

RSpec.describe Tournament::Tournament do
  let(:name) { 'Battle Stadium #1' }
  let(:organization) { create(:organization) }
  let(:game) { create(:game) }
  let(:format) { create(:format, game:) }
  let(:start_date) do
    Time.use_zone('Central Time (US & Canada)') do
      return Time.zone.parse('2007-07-07 12:00 PM').utc
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:organization).class_name('Organization::Organization') }
    it { is_expected.to belong_to(:game).class_name('Game') }
    it { is_expected.to belong_to(:format).class_name('Tournament::Format') }
    it { is_expected.to have_many(:phases).class_name('Phase::BasePhase').dependent(:destroy_async) }
    it { is_expected.to have_many(:registrations).class_name('Tournament::Registration').dependent(:destroy_async) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      tournament = described_class.new(name:, start_date:, organization:, game:, format:)
      expect(tournament).to be_valid
    end

    it 'is not valid without a name' do
      tournament = described_class.new(start_date:, organization:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a start_date' do
      tournament = described_class.new(name:, organization:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without an organization' do
      tournament = described_class.new(name:, start_date:, game:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a game' do
      tournament = described_class.new(name:, start_date:, organization:, format:)
      expect(tournament).not_to be_valid
    end

    it 'is not valid without a format' do
      tournament = described_class.new(name:, start_date:, organization:, game:)
      expect(tournament).not_to be_valid
    end
  end
end
