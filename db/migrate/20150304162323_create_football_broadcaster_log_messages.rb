class CreateFootballBroadcasterLogMessages < ActiveRecord::Migration
  def change
    create_table :football_broadcaster_log_messages do |t|
      t.text :body
      t.integer :minutes, default: nil
      t.integer :seconds, default: nil
      t.references :broadcast, index: true

      t.timestamps null: false
    end
    add_foreign_key :football_broadcaster_log_messages, :broadcasts
  end
end
