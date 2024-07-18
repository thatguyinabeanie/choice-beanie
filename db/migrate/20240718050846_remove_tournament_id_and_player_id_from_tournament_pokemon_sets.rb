class RemoveTournamentIdAndPlayerIdFromTournamentPokemonSets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_pokemon_sets, :tournament_id, :integer
    remove_column :tournament_pokemon_sets, :player_id, :integer
  end
end
