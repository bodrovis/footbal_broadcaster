# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150211165429) do

  create_table "football_broadcaster_broadcasts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "home_team_id"
    t.integer  "guest_team_id"
  end

  add_index "football_broadcaster_broadcasts", ["guest_team_id"], name: "index_football_broadcaster_broadcasts_on_guest_team_id"
  add_index "football_broadcaster_broadcasts", ["home_team_id"], name: "index_football_broadcaster_broadcasts_on_home_team_id"

  create_table "football_broadcaster_participating_players", force: :cascade do |t|
    t.integer  "broadcast_id"
    t.integer  "player_id"
    t.boolean  "reserve"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "football_broadcaster_participating_players", ["broadcast_id"], name: "index_x_participating_players_on_broascast_id"
  add_index "football_broadcaster_participating_players", ["player_id"], name: "index_x_participating_players_on_player_id"
  add_index "football_broadcaster_participating_players", ["reserve"], name: "index_x_participating_players_on_reserve"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
