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

ActiveRecord::Schema[7.1].define(version: 2024_03_25_111649) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointment_contacts", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_contacts_on_appointment_id"
    t.index ["contact_id"], name: "index_appointment_contacts_on_contact_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.string "time"
    t.string "address"
    t.float "location_latitude"
    t.float "location_longitude"
    t.string "category"
    t.boolean "child_presence_mandatory"
    t.text "details"
    t.bigint "appointment_creator_id", null: false
    t.bigint "parent_in_charge_id", null: false
    t.bigint "user_id", null: false
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "contact_id"
    t.index ["appointment_creator_id"], name: "index_appointments_on_appointment_creator_id"
    t.index ["child_id"], name: "index_appointments_on_child_id"
    t.index ["contact_id"], name: "index_appointments_on_contact_id"
    t.index ["parent_in_charge_id"], name: "index_appointments_on_parent_in_charge_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "birth_place"
    t.string "school"
    t.bigint "first_parent_id", null: false
    t.bigint "second_parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_parent_id"], name: "index_children_on_first_parent_id"
    t.index ["second_parent_id"], name: "index_children_on_second_parent_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "phone_number"
    t.string "email"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.text "details"
  end

  create_table "custody_timeframes", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "parent_in_charge_id", null: false
    t.bigint "custody_creator_id", null: false
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_custody_timeframes_on_child_id"
    t.index ["custody_creator_id"], name: "index_custody_timeframes_on_custody_creator_id"
    t.index ["parent_in_charge_id"], name: "index_custody_timeframes_on_parent_in_charge_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.date "added_date"
    t.text "details"
    t.bigint "child_id"
    t.bigint "document_creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "doctype"
    t.integer "category"
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.string "attachment"
    t.index ["child_id"], name: "index_documents_on_child_id"
    t.index ["document_creator_id"], name: "index_documents_on_document_creator_id"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.date "deadline"
    t.text "requirements"
    t.boolean "status"
    t.string "category"
    t.text "details"
    t.bigint "child_id", null: false
    t.bigint "task_creator_id", null: false
    t.bigint "parent_in_charge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_tasks_on_child_id"
    t.index ["parent_in_charge_id"], name: "index_tasks_on_parent_in_charge_id"
    t.index ["task_creator_id"], name: "index_tasks_on_task_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointment_contacts", "appointments"
  add_foreign_key "appointment_contacts", "contacts"
  add_foreign_key "appointments", "children"
  add_foreign_key "appointments", "contacts"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "users", column: "appointment_creator_id"
  add_foreign_key "appointments", "users", column: "parent_in_charge_id"
  add_foreign_key "children", "users", column: "first_parent_id"
  add_foreign_key "children", "users", column: "second_parent_id"
  add_foreign_key "custody_timeframes", "children"
  add_foreign_key "custody_timeframes", "users", column: "custody_creator_id"
  add_foreign_key "custody_timeframes", "users", column: "parent_in_charge_id"
  add_foreign_key "documents", "children"
  add_foreign_key "documents", "users", column: "document_creator_id"
  add_foreign_key "tasks", "children"
  add_foreign_key "tasks", "users", column: "parent_in_charge_id"
  add_foreign_key "tasks", "users", column: "task_creator_id"
end
