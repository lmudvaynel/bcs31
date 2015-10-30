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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151030083701) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "banners", :force => true do |t|
    t.string   "content"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "cities", :force => true do |t|
    t.integer  "region_id"
    t.boolean  "central"
    t.boolean  "district_level"
    t.boolean  "affiliate"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "cities", ["name"], :name => "index_cities_on_name"
  add_index "cities", ["region_id"], :name => "index_cities_on_region_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "delivery_city_relations", :force => true do |t|
    t.integer  "city_from_id"
    t.integer  "city_to_id"
    t.string   "delivery_time"
    t.boolean  "business_morning"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedbacks", ["email"], :name => "index_feedbacks_on_email"

  create_table "invoices", :force => true do |t|
    t.string   "status"
    t.integer  "number"
    t.string   "send_from"
    t.string   "arrival_to"
    t.string   "recipient_surname"
    t.string   "recipient_role"
    t.datetime "delivered_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "news_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "published_at"
  end

  create_table "online_couriers", :force => true do |t|
    t.string   "transportation"
    t.date     "date"
    t.string   "time_start"
    t.string   "time_end"
    t.string   "full_name"
    t.string   "phone"
    t.string   "company"
    t.string   "address"
    t.string   "weight"
    t.string   "amount"
    t.string   "size"
    t.string   "cargo_type"
    t.string   "city"
    t.string   "payment"
    t.string   "payer"
    t.string   "payer_number"
    t.string   "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.boolean  "hidden",     :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "seo_id"
    t.string   "layout",     :default => "application"
    t.string   "ancestry"
    t.integer  "position"
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"
  add_index "pages", ["layout"], :name => "index_pages_on_layout"
  add_index "pages", ["position"], :name => "index_pages_on_position"
  add_index "pages", ["seo_id"], :name => "index_pages_on_seo_id"
  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "partners", :force => true do |t|
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "main_city_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "regions", ["name"], :name => "index_regions_on_name"

  create_table "reviews", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "logo"
    t.string   "city"
    t.text     "content"
    t.boolean  "moderated",    :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "email"
  end

  create_table "seos", :force => true do |t|
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "social_networks", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "position"
    t.boolean  "hidden",     :default => false
  end

  create_table "tariffs", :force => true do |t|
    t.integer  "zone_id"
    t.float    "weight_start"
    t.float    "weight_end"
    t.integer  "price_cents"
    t.boolean  "contract_price"
    t.integer  "additional_price_cents"
    t.string   "cargo_kind"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "tariffs", ["weight_end"], :name => "index_tariffs_on_weight_end"
  add_index "tariffs", ["weight_start"], :name => "index_tariffs_on_weight_start"
  add_index "tariffs", ["zone_id"], :name => "index_tariffs_on_zone_id"

  create_table "workers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.string   "photo"
    t.string   "phone"
    t.string   "job"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  add_index "workers", ["position"], :name => "index_workers_on_position"

  create_table "zone_delivery_relations", :force => true do |t|
    t.integer  "zone_id"
    t.integer  "delivery_city_relation_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
