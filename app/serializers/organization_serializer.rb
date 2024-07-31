require_relative 'user_serializer'

class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner

  def owner
    ::UserSerializer.new(object.owner).attributes
  end
end

class OrganizationDetailsSerializer < OrganizationSerializer
  attributes :id, :name, :owner, :updated_at, :created_at, :slug, :description, :slug

  def owner
    ::UserDetailsSerializer.new(object.owner).attributes
  end
end
