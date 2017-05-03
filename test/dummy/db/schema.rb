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

ActiveRecord::Schema.define(version: 20170503171001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "binda_assets", force: :cascade do |t|
    t.string   "image"
    t.integer  "field_setting_id"
    t.string   "fieldable_type"
    t.integer  "fieldable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_setting_id"], name: "index_binda_assets_on_field_setting_id", using: :btree
    t.index ["fieldable_type", "fieldable_id"], name: "index_binda_assets_on_fieldable_type_and_fieldable_id", using: :btree
  end

  create_table "binda_bindings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "binda_categories", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "slug"
    t.integer  "structure_id"
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["slug"], name: "index_binda_categories_on_slug", unique: true, using: :btree
    t.index ["structure_id"], name: "index_binda_categories_on_structure_id", using: :btree
  end

  create_table "binda_categories_components", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "component_id"
    t.index ["category_id"], name: "index_binda_categories_components_on_category_id", using: :btree
    t.index ["component_id"], name: "index_binda_categories_components_on_component_id", using: :btree
  end

  create_table "binda_components", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "slug"
    t.string   "publish_state"
    t.integer  "position"
    t.integer  "structure_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["slug"], name: "index_binda_components_on_slug", unique: true, using: :btree
    t.index ["structure_id"], name: "index_binda_components_on_structure_id", using: :btree
  end

  create_table "binda_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "field_setting_id"
    t.string   "fieldable_type"
    t.integer  "fieldable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_setting_id"], name: "index_binda_dates_on_field_setting_id", using: :btree
    t.index ["fieldable_type", "fieldable_id"], name: "index_binda_dates_on_fieldable_type_and_fieldable_id", using: :btree
  end

  create_table "binda_field_groups", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "slug"
    t.text     "description"
    t.integer  "position"
    t.string   "layout"
    t.integer  "structure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["slug"], name: "index_binda_field_groups_on_slug", unique: true, using: :btree
    t.index ["structure_id"], name: "index_binda_field_groups_on_structure_id", using: :btree
  end

  create_table "binda_field_settings", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "slug"
    t.text     "description"
    t.integer  "position"
    t.boolean  "required"
    t.text     "default_text"
    t.string   "field_type"
    t.integer  "field_group_id"
    t.integer  "field_setting_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_group_id"], name: "index_binda_field_settings_on_field_group_id", using: :btree
    t.index ["field_setting_id"], name: "index_binda_field_settings_on_field_setting_id", using: :btree
    t.index ["slug"], name: "index_binda_field_settings_on_slug", unique: true, using: :btree
  end

  create_table "binda_galleries", force: :cascade do |t|
    t.integer  "position"
    t.integer  "field_setting_id"
    t.string   "fieldable_type"
    t.integer  "fieldable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_setting_id"], name: "index_binda_galleries_on_field_setting_id", using: :btree
    t.index ["fieldable_type", "fieldable_id"], name: "index_binda_galleries_on_fieldable_type_and_fieldable_id", using: :btree
  end

  create_table "binda_repeaters", force: :cascade do |t|
    t.integer  "position"
    t.integer  "field_setting_id"
    t.string   "fieldable_type"
    t.integer  "fieldable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_setting_id"], name: "index_binda_repeaters_on_field_setting_id", using: :btree
    t.index ["fieldable_type", "fieldable_id"], name: "index_binda_repeaters_on_fieldable_type_and_fieldable_id", using: :btree
  end

  create_table "binda_settings", force: :cascade do |t|
    t.string  "name",                     null: false
    t.string  "slug"
    t.text    "content"
    t.integer "position"
    t.boolean "is_true",  default: false
    t.index ["slug"], name: "index_binda_settings_on_slug", unique: true, using: :btree
  end

  create_table "binda_structures", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_binda_structures_on_slug", unique: true, using: :btree
  end

  create_table "binda_texts", force: :cascade do |t|
    t.text     "content"
    t.integer  "position"
    t.integer  "field_setting_id"
    t.string   "fieldable_type"
    t.integer  "fieldable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["field_setting_id"], name: "index_binda_texts_on_field_setting_id", using: :btree
    t.index ["fieldable_type", "fieldable_id"], name: "index_binda_texts_on_fieldable_type_and_fieldable_id", using: :btree
  end

  create_table "binda_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "is_superadmin",          default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_binda_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_binda_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_binda_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_binda_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

end
