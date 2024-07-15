# frozen_string_literal: true

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

# rubocop:disable all
ActiveRecord::Schema[7.1].define(version: 2024_07_15_141840) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_scores", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "winner_id", null: false
    t.bigint "loser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loser_id"], name: "index_match_scores_on_loser_id"
    t.index ["match_id"], name: "index_match_scores_on_match_id"
    t.index ["winner_id"], name: "index_match_scores_on_winner_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.integer "round"
    t.bigint "player1_id", null: false
    t.bigint "player2_id", null: false
    t.bigint "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player1_id"], name: "index_matches_on_player1_id"
    t.index ["player2_id"], name: "index_matches_on_player2_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "organizer_staffs", force: :cascade do |t|
    t.bigint "organizer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_organizer_staffs_on_organizer_id"
    t.index ["user_id"], name: "index_organizer_staffs_on_user_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_sets", force: :cascade do |t|
    t.string "name"
    t.string "ability"
    t.string "tera_type"
    t.string "nature"
    t.string "held_item"
    t.string "move1"
    t.string "move2"
    t.string "move3"
    t.string "move4"
    t.bigint "tournament_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_format_id"
    t.index ["player_id"], name: "index_pokemon_sets_on_player_id"
    t.index ["tournament_format_id"], name: "index_pokemon_sets_on_tournament_format_id"
    t.index ["tournament_id"], name: "index_pokemon_sets_on_tournament_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "tournament_formats", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_tournament_formats_on_game_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "match_scores", "matches"
  add_foreign_key "match_scores", "users", column: "loser_id"
  add_foreign_key "match_scores", "users", column: "winner_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "matches", "users", column: "player1_id"
  add_foreign_key "matches", "users", column: "player2_id"
  add_foreign_key "matches", "users", column: "winner_id"
  add_foreign_key "organizer_staffs", "organizers"
  add_foreign_key "organizer_staffs", "users"
  add_foreign_key "pokemon_sets", "tournament_formats"
  add_foreign_key "pokemon_sets", "tournaments"
  add_foreign_key "pokemon_sets", "users", column: "player_id"
  add_foreign_key "registrations", "tournaments"
  add_foreign_key "registrations", "users"
  add_foreign_key "tournament_formats", "games"
end
# rubocop:enable all
