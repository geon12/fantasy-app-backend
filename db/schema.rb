# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_28_002745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commissioners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_commissioners_on_league_id"
    t.index ["user_id"], name: "index_commissioners_on_user_id"
  end

  create_table "fantasy_teams", force: :cascade do |t|
    t.string "team_name"
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_fantasy_teams_on_league_id"
    t.index ["user_id"], name: "index_fantasy_teams_on_user_id"
  end

  create_table "free_agents", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_free_agents_on_league_id"
    t.index ["player_id"], name: "index_free_agents_on_player_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "team_num"
    t.integer "pg_num"
    t.integer "sg_num"
    t.integer "pf_num"
    t.integer "c_num"
    t.integer "f_num"
    t.integer "g_num"
    t.integer "util_num"
    t.integer "be_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_positions", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_positions_on_player_id"
    t.index ["position_id"], name: "index_player_positions_on_position_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.float "fppg"
    t.string "nba_team"
    t.boolean "active"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "shorthand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_players", force: :cascade do |t|
    t.bigint "fantasy_team_id", null: false
    t.bigint "player_id", null: false
    t.boolean "bench"
    t.boolean "utility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fantasy_team_id"], name: "index_team_players_on_fantasy_team_id"
    t.index ["player_id"], name: "index_team_players_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "commissioners", "leagues"
  add_foreign_key "commissioners", "users"
  add_foreign_key "fantasy_teams", "leagues"
  add_foreign_key "fantasy_teams", "users"
  add_foreign_key "free_agents", "leagues"
  add_foreign_key "free_agents", "players"
  add_foreign_key "player_positions", "players"
  add_foreign_key "player_positions", "positions"
  add_foreign_key "team_players", "fantasy_teams"
  add_foreign_key "team_players", "players"
end
