module Serializer
  module NameMixin
    extend ActiveSupport::Concern
    included do
      attribute :name
    end
  end

  module IdMixin
    extend ActiveSupport::Concern
    included do
      attribute :id
    end
  end

  module TimestampMixin
    extend ActiveSupport::Concern
    included do
      attributes :created_at, :updated_at
    end
  end
end
