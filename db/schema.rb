# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_22_204528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "guid", limit: 32
    t.integer "xml_batch_id"
    t.date "creation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_data", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "parcel_code"
    t.integer "item_qty"
    t.integer "parcel_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_data_on_invoice_id"
    t.index ["parcel_code"], name: "index_invoice_data_on_parcel_code"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.integer "company_code"
    t.integer "operation_number"
    t.date "operation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batch_id"], name: "index_invoices_on_batch_id"
    t.index ["operation_number"], name: "index_invoices_on_operation_number"
  end

  add_foreign_key "invoice_data", "invoices"
  add_foreign_key "invoices", "batches"
end
