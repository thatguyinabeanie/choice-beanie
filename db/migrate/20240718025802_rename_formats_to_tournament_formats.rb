class RenameFormatsToTournamentFormats < ActiveRecord::Migration[6.0]
  def change
    rename_table :formats, :tournament_formats
  end
end
