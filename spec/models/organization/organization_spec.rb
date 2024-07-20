require 'rails_helper'

RSpec.describe Organization::Organization do
  describe 'validations' do
    # Ensure an organization instance exists for the uniqueness test
    subject(:organization) { create(:organization) }

    before { create(:user, id: 1) }

    it { is_expected.to validate_presence_of(:name) }

    it 'validates uniqueness of owner_id' do
      expect(organization).to validate_uniqueness_of(:owner_id)
    end
  end

  describe 'associations' do
    let(:org_owner) do
      create(:user, username: 'fuecoco_number_1', email: 'fuecoco@example.com', pronouns: 'he/him', first_name: 'John', last_name: 'Doe', password: '12345678', password_confirmation: '12345678')
    end
    let(:organization) { create(:organization, owner: org_owner) }

    it { is_expected.to belong_to(:owner) }
    it { is_expected.to have_many(:organization_memberships).class_name('Organization::Membership').dependent(:destroy) }
    it { is_expected.to have_many(:staff).through(:organization_memberships).source(:user) }
    it { is_expected.to have_many(:tournaments).through(:organization_tournaments) }

    describe 'adding and removing staff' do
      let(:user) { create(:user) }

      it 'does not have any staff by default' do
        expect(organization.staff).to be_empty
      end

      it 'adds user to organization staff' do
        organization.update!(staff: [user])
        expect(organization.staff).to include(user)
      end

      it 'removes user from organization staff' do
        organization.update!(staff: [user])
        organization.staff.delete(user)
        organization.save!
        expect(organization.staff).to be_empty
      end
    end

    describe 'adding and removing tournaments' do
      let(:tournament) { create(:tournament) }

      it 'adds tournament to organization tournaments' do
        organization.update!(tournaments: [tournament])
        expect(organization.tournaments).to include(tournament)
      end

      it 'removes tournament from organization tournaments' do
        organization.update!(tournaments: [tournament])
        organization.tournaments.delete(tournament)
        organization.save!
        expect(organization.tournaments).to be_empty
      end
    end
  end

  describe 'friendly_id' do
    it 'uses the name attribute for friendly_id' do
      owner = create(:user)
      organization = described_class.create!(name: 'My Organization', owner:)
      expect(organization.friendly_id).to eq('my-organization')
    end
  end
end
