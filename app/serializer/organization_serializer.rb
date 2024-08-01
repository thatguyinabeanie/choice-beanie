require_relative 'user_serializer'
require_relative 'serializer_mixins'

module Serializer
  module OrganizationMixin
    extend ActiveSupport::Concern
    included do
      class_attribute :owner_serializer
      attributes :owner
      include IdMixin
      include NameMixin
    end

    def owner
      owner_serializer.new(object.owner).attributes
    end
  end

  class Organization < ActiveModel::Serializer
    include OrganizationMixin
    self.owner_serializer = Serializer::User
  end

  class OrganizationDetails < ActiveModel::Serializer
    include OrganizationMixin
    include TimestampMixin
    attributes :description
    self.owner_serializer = Serializer::UserDetails
  end
end
