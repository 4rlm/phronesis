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

ActiveRecord::Schema.define(version: 20170908130424) do

  create_table "accounts", force: :cascade do |t|
    t.string "status"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.string "full_address"
    t.string "address_pin"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_addresses_on_address_id"
  end

  create_table "addressings", force: :cascade do |t|
    t.integer "address_id"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_addressings_on_address_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addressings_on_addressable_type_and_addressable_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "status"
    t.string "source"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crmings", force: :cascade do |t|
    t.integer "crm_id"
    t.string "crmable_type"
    t.integer "crmable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crm_id"], name: "index_crmings_on_crm_id"
    t.index ["crmable_type", "crmable_id"], name: "index_crmings_on_crmable_type_and_crmable_id"
  end

  create_table "crms", force: :cascade do |t|
    t.integer "crm_id"
    t.string "type"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crm_id"], name: "index_crms_on_crm_id"
  end

  create_table "orgings", force: :cascade do |t|
    t.integer "org_id"
    t.string "orgable_type"
    t.integer "orgable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["org_id"], name: "index_orgings_on_org_id"
    t.index ["orgable_type", "orgable_id"], name: "index_orgings_on_orgable_type_and_orgable_id"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil], name: "index_orgs_on_org", unique: true
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_phones_on_phone", unique: true
  end

  create_table "phonings", force: :cascade do |t|
    t.integer "phone_id"
    t.string "phonable_type"
    t.integer "phonable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phonable_type", "phonable_id"], name: "index_phonings_on_phonable_type_and_phonable_id"
    t.index ["phone_id"], name: "index_phonings_on_phone_id"
  end

  create_table "urlings", force: :cascade do |t|
    t.integer "url_id"
    t.string "urlable_type"
    t.integer "urlable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_id"], name: "index_urlings_on_url_id"
    t.index ["urlable_type", "urlable_id"], name: "index_urlings_on_urlable_type_and_urlable_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "url"
    t.boolean "valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_urls_on_url", unique: true
  end

end
