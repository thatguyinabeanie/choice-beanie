module Organization
  class OrganizationTournament < ApplicationRecord
    belongs_to :organization, class_name: 'Organization::Organization'
    belongs_to :tournament, class_name: 'Tournament::Tournament'
  end
end
