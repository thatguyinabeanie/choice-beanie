require_relative 'user_serializer'
require_relative 'serializer_mixin'

module Serializer
  module OrganizationMixin
    extend ActiveSupport::Concern
    included do
      class_attribute :owner_serializer
      attributes :owner
      include SerializerMixin::Id
      include SerializerMixin::Name
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
    include SerializerMixin::Timestamp
    attributes :description
    self.owner_serializer = Serializer::UserDetails
  end
end
