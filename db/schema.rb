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

ActiveRecord::Schema[7.2].define(version: 2025_07_12_104611) do
  create_table "health_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_metrics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "date", null: false
    t.text "data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "date"], name: "index_health_metrics_on_name_and_date"
  end

  create_table "metric_presentations", force: :cascade do |t|
    t.string "metric_name"
    t.string "chart_type"
    t.text "lambda"
    t.string "color_palette"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_name"], name: "index_metric_presentations_on_metric_name", unique: true
  end
end
