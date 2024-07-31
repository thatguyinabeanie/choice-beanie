FactoryBot.define do
  factory :organization_staff_member, class: 'Organization::StaffMember' do
    organization
    user factory: :user
  end
end
