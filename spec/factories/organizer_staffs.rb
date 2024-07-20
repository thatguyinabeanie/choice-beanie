FactoryBot.define do
  factory :organization_membership, class: 'Organization::Membership' do
    organization
    user
  end
end
