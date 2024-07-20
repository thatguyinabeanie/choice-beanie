FactoryBot.define do
  factory :organization_membership, class: 'Organization::StaffMember' do
    organization
    user
  end
end
