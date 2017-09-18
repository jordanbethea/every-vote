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

ActiveRecord::Schema.define(version: 20170913221538) do

  create_table "approval_entries", force: :cascade do |t|
    t.integer  "selection_id"
    t.integer  "approval_vote_model_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "approval_entries", ["approval_vote_model_id"], name: "index_approval_entries_on_approval_vote_model_id"

  create_table "approval_vote_models", force: :cascade do |t|
    t.integer  "full_vote_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "approval_vote_models", ["full_vote_id"], name: "index_approval_vote_models_on_full_vote_id"

  create_table "ballots", force: :cascade do |t|
    t.string   "electioneer"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "full_votes", force: :cascade do |t|
    t.string   "name"
    t.integer  "ballot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "full_votes", ["ballot_id"], name: "index_full_votes_on_ballot_id"

  create_table "ranked_vote_models", force: :cascade do |t|
    t.integer  "full_vote_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ranked_vote_models", ["full_vote_id"], name: "index_ranked_vote_models_on_full_vote_id"

  create_table "rankings", force: :cascade do |t|
    t.integer  "rank"
    t.integer  "ranked_vote_model_id"
    t.integer  "selection_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rankings", ["ranked_vote_model_id"], name: "index_rankings_on_ranked_vote_model_id"

  create_table "selections", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "ballot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "selections", ["ballot_id"], name: "index_selections_on_ballot_id"

  create_table "single_vote_models", force: :cascade do |t|
    t.integer  "selection_id"
    t.integer  "full_vote_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "single_vote_models", ["full_vote_id"], name: "index_single_vote_models_on_full_vote_id"

end
