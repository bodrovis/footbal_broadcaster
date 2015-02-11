class AddHomeAndGuestToBroadcasts < ActiveRecord::Migration
  def change
    add_column :football_broadcaster_broadcasts, :home_team_id, :integer
    add_column :football_broadcaster_broadcasts, :guest_team_id, :integer
    add_index :football_broadcaster_broadcasts, :home_team_id
    add_index :football_broadcaster_broadcasts, :guest_team_id
  end
end
