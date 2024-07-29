require_relative 'user_serializer'
module Serializer
  class Organization < ActiveModel::Serializer
    include JSONAPI::Serializer
    attributes :id, :name, :slug
  end

  class OrganizationDetails < Organization
    include JSONAPI::Serializer
    attributes :updated_at, :created_at, :slug, :description
    has_one :owner, serializer: Serializer::User
  end
end
