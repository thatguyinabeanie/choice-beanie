module Phase
  class Base < ApplicationRecord
    self.table_name = 'phases'
    self.abstract_class = true
    belongs_to :tournament
  end
end
