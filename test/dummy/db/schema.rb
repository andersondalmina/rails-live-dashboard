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

ActiveRecord::Schema[7.1].define(version: 2024_02_13_133517) do
  create_table "rails_live_dashboard_entries", force: :cascade do |t|
    t.string "type", null: false
    t.string "batch_id", limit: 36, null: false
    t.json "content", null: false
    t.boolean "should_show", default: true
    t.datetime "created_at", null: false
    t.index ["batch_id"], name: "index_rails_live_dashboard_entries_on_batch_id"
    t.index ["created_at"], name: "index_rails_live_dashboard_entries_on_created_at"
  end

end
