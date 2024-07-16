module Phase
  class Base < ApplicationRecord
    self.table_name = 'phases'
    self.abstract_class = true
    belongs_to :tournament, class_name: 'Tournament::Tournament', through: :tournament_phases
  end
end
