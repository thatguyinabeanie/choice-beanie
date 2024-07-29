require_relative 'user_serializer'
module Serializer
  class Organization < ActiveModel::Serializer
    attributes :id, :name, :owner

    def owner
      Serializer::User.new(object.owner).attributes
    end
  end

  class OrganizationDetails < Organization
    attributes :updated_at, :created_at, :slug, :description, :slug

    def owner
      Serializer::UserDetails.new(object.owner).attributes
    end
  end
end
