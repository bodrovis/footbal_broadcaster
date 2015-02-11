class CreateFootballBroadcasterBroadcasts < ActiveRecord::Migration
  def change
    create_table :football_broadcaster_broadcasts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
