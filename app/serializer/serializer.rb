module Serializer
  module Mixin
    module Name
      extend ActiveSupport::Concern
      included do
        attribute :name
      end
    end

    module Id
      extend ActiveSupport::Concern
      included do
        attribute :id
      end
    end

    module Timestamp
      extend ActiveSupport::Concern
      included do
        attributes :created_at, :updated_at
      end
    end
  end
end
