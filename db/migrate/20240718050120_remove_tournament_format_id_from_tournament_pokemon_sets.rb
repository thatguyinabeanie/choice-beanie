class RemoveTournamentFormatIdFromTournamentPokemonSets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_pokemon_sets, :tournament_format_id, :integer
  end
end
