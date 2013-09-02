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

ActiveRecord::Schema.define(version: 20130829205039) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description", default: "Description:\n-\n\n{description goes here}\nRelated Games:\n-\n[game:sample]\n\nWalkthrough:\n-\n\n{sample walkthrough to be replaced\nInitial deal - \n\n * player 1 - [card:ace of spades][card:two of spades]\n * player 2 - [card:ace of clubs][card:two of clubs]\n * player 3 - [card:ace of hearts][card:two of hearts]\n\nRound of betting\n\nDeal a community card - [card:king of diamonds]\n\nRound of betting\n\nDeclare winner\n}"
    t.integer  "style_id"
    t.integer  "min_players"
    t.integer  "max_players"
    t.integer  "num_cards"
    t.string   "tags",        default: [],                                                                                                                                                                                                                                                                                                                                                                                                                                               array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["style_id"], name: "index_games_on_style_id", using: :btree
  add_index "games", ["tags"], name: "index_games_on_tags", using: :gin

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
