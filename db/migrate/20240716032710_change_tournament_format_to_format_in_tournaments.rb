class ChangeTournamentFormatToFormatInTournaments < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournaments, :tournament_format_id, :bigint
    add_column :tournaments, :format_id, :bigint
    add_index :tournaments, :format_id
  end
end
