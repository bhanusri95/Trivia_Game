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

ActiveRecord::Schema.define(version: 20180208045704) do

  create_table "rs_evaluations", force: :cascade do |t|
    t.string "reputation_name"
    t.string "source_type"
    t.integer "source_id"
    t.string "target_type"
    t.integer "target_id"
    t.float "value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name"
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type"
    t.index ["source_type", "source_id"], name: "index_rs_evaluations_on_source_type_and_source_id"
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_evaluations_on_target_type_and_target_id"
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.float "weight", default: 1.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id"
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type"
    t.index ["sender_type", "sender_id"], name: "index_rs_reputation_messages_on_sender_type_and_sender_id"
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string "reputation_name"
    t.float "value", default: 0.0
    t.string "aggregated_by"
    t.string "target_type"
    t.integer "target_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name"
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_reputations_on_target_type_and_target_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_scores_on_tag_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "trivium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["trivium_id"], name: "index_taggings_on_trivium_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trivia", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "FirstName"
    t.string "MiddleName"
    t.string "LastName"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
