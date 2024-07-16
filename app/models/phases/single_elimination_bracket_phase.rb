module Phase
  class SingleEliminationBracket < ApplicationRecord
    self.table_name = 'phases'
    belongs_to :tournament
  end
end
