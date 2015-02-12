class CreateFootballBroadcasterParticipatingPlayers < ActiveRecord::Migration
  def change
    create_table :football_broadcaster_participating_players do |t|
      t.references :broadcast
      t.references :player
      t.boolean :reserve

      t.timestamps null: false
    end
    add_foreign_key :football_broadcaster_participating_players, :broadcasts
    add_foreign_key :football_broadcaster_participating_players, :players
    add_index :football_broadcaster_participating_players, :broadcast_id,
              name: 'index_x_participating_players_on_broascast_id'
    add_index :football_broadcaster_participating_players, :player_id,
              name: 'index_x_participating_players_on_player_id'
    add_index :football_broadcaster_participating_players, :reserve,
              name: 'index_x_participating_players_on_reserve'
  end
end
