class AddOrganizationRefToTournaments < ActiveRecord::Migration[7.1]
  def change
    add_reference :tournaments, :organization, null: false, foreign_key: true
  end
end
