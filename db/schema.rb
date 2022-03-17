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

ActiveRecord::Schema[7.0].define(version: 20_220_315_145_333) do
  create_table 'checks', force: :cascade do |t|
    t.integer 'total_sum_id'
    t.string 'title'
    t.text 'body'
    t.integer 'cost'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['total_sum_id'], name: 'index_checks_on_total_sum_id'
  end

  create_table 'total_sums', force: :cascade do |t|
    t.integer 'checks_id'
    t.string 'title'
    t.text 'for_what'
    t.integer 'count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['checks_id'], name: 'index_total_sums_on_checks_id'
  end

  add_foreign_key 'checks', 'total_sums'
  add_foreign_key 'total_sums', 'checks', column: 'checks_id'
end
