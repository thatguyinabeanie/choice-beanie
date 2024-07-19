require 'rails_helper'

RSpec.describe Organization::Organization do
  describe 'associations' do
    it { is_expected.to belong_to(:owner) }
    it { is_expected.to have_many(:organization_memberships).class_name('Organization::Membership').dependent(:destroy) }
    it { is_expected.to have_many(:staff).through(:organization_memberships).source(:user) }
    it { is_expected.to have_many(:tournaments).through(:organization_tournaments) }

    it 'correctly adds user to organization staff' do # rubocop:disable RSpec/MultipleExpectations,RSpec/ExampleLength
      org_owner = create(:user, username: 'fuecoco_number_1', email: 'fuecoco@example.com', pronouns: 'he/him', first_name: 'John', last_name: 'Doe', password: '12345678',
                                password_confirmation: '12345678')

      organization = create(:organization, owner: org_owner, name: 'My Organization')

      expect(org_owner.staff).to be_empty

      user = create(:user)
      organization.staff << user
      organization.save!

      user.reload
      org_owner.reload
      expect(user.staff).not_to be_empty
      expect(org_owner.staff).to be_empty
      expect(organization.staff).to include(user)
      expect(organization.staff).to eq(user.staff)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'friendly_id' do
    it 'uses the name attribute for friendly_id' do
      owner = create(:user)
      organization = described_class.create!(name: 'My Organization', owner:)
      expect(organization.friendly_id).to eq('my-organization')
    end
  end
end
