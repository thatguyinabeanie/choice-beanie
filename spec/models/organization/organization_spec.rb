require 'rails_helper'

RSpec.describe Organization::Organization do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:organization_staff).class_name('Organization::Staff').dependent(:destroy) }
    it { is_expected.to have_many(:staff).through(:organization_staff).source(:user) }
    it { is_expected.to have_many(:tournaments).through(:organization_tournaments) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'friendly_id' do
    it 'uses the name attribute for friendly_id' do
      user = create(:user)
      organization = described_class.create!(name: 'My Organization', user:)
      expect(organization.friendly_id).to eq('my-organization')
    end
  end
end
