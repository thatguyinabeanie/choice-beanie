require_relative 'user_serializer'

class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner

  def owner
    ::UserSerializer.new(object.owner).attributes
  end
end

class OrganizationDetailSerializer < OrganizationSerializer
  attributes :id, :name, :owner, :updated_at, :created_at, :slug, :description, :slug

  def owner
    ::UserDetailSerializer.new(object.owner).attributes
  end
end
