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

ActiveRecord::Schema.define(version: 20140915223025) do

  create_table "pzz_car_images", force: true do |t|
    t.integer  "pzz_car_id",             default: 0, null: false
    t.string   "car_image_file_name"
    t.string   "car_image_content_type"
    t.integer  "car_image_file_size"
    t.datetime "car_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_car_images", ["pzz_car_id"], name: "index_pzz_car_images_on_pzz_car_id", using: :btree

  create_table "pzz_cars", force: true do |t|
    t.integer  "pzz_user_id",                    default: 0,  null: false
    t.integer  "pzz_driver_identity_id",         default: 0,  null: false
    t.string   "user_realname",                  default: "", null: false
    t.integer  "car_type",                       default: 0,  null: false
    t.string   "car_brand_name",                 default: "", null: false
    t.integer  "car_seats",                      default: 0,  null: false
    t.string   "car_plate_no",                   default: "", null: false
    t.string   "car_vin",                        default: "", null: false
    t.string   "car_engine_no",                  default: "", null: false
    t.string   "identity_vl_no",                 default: "", null: false
    t.string   "identity_vl_image_file_name"
    t.string   "identity_vl_image_content_type"
    t.integer  "identity_vl_image_file_size"
    t.datetime "identity_vl_image_updated_at"
    t.datetime "identity_vl_issued",                          null: false
    t.string   "insurance_corporate",            default: "", null: false
    t.string   "insurance_no",                   default: "", null: false
    t.datetime "insurance_expired",                           null: false
    t.string   "insurance_image_file_name"
    t.string   "insurance_image_content_type"
    t.integer  "insurance_image_file_size"
    t.datetime "insurance_image_updated_at"
    t.integer  "identity_status",                default: 0,  null: false
    t.text     "identity_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_cars", ["pzz_driver_identity_id"], name: "index_pzz_cars_on_pzz_driver_identity_id", using: :btree
  add_index "pzz_cars", ["pzz_user_id"], name: "index_pzz_cars_on_pzz_user_id", using: :btree

  create_table "pzz_comment_meta", force: true do |t|
    t.integer  "pzz_comment_id",    default: 0,  null: false
    t.string   "commentmeta_key",   default: "", null: false
    t.text     "commentmeta_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_comment_meta", ["pzz_comment_id"], name: "index_pzz_comment_meta_on_pzz_comment_id", using: :btree

  create_table "pzz_comments", force: true do |t|
    t.integer  "pzz_user_id",       default: 0,  null: false
    t.integer  "pzz_post_id",       default: 0,  null: false
    t.string   "user_email",        default: "", null: false
    t.string   "user_url",          default: "", null: false
    t.string   "user_ip",           default: "", null: false
    t.text     "comment_content"
    t.integer  "comment_approved",  default: 0,  null: false
    t.string   "user_agent",        default: "", null: false
    t.integer  "comment_parent_id", default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_comments", ["pzz_post_id"], name: "index_pzz_comments_on_pzz_post_id", using: :btree
  add_index "pzz_comments", ["pzz_user_id"], name: "index_pzz_comments_on_pzz_user_id", using: :btree

  create_table "pzz_draw_configs", force: true do |t|
    t.string   "draw_title",       default: "", null: false
    t.text     "draw_description"
    t.datetime "draw_starttime",                null: false
    t.datetime "draw_endtime",                  null: false
    t.integer  "user_filter",      default: 0,  null: false
    t.integer  "draw_count",       default: 0,  null: false
    t.integer  "draw_type",        default: 0,  null: false
    t.integer  "draw_status",      default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pzz_draw_histories", force: true do |t|
    t.integer  "pzz_user_id",        default: 0,  null: false
    t.integer  "pzz_draw_config_id", default: 0,  null: false
    t.integer  "pzz_draw_prize_id",  default: 0,  null: false
    t.string   "user_nickname",      default: "", null: false
    t.string   "draw_title",         default: "", null: false
    t.string   "prize_place_name",   default: "", null: false
    t.string   "prize_content",      default: "", null: false
    t.integer  "draw_status",        default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_draw_histories", ["pzz_draw_config_id"], name: "index_pzz_draw_histories_on_pzz_draw_config_id", using: :btree
  add_index "pzz_draw_histories", ["pzz_draw_prize_id"], name: "index_pzz_draw_histories_on_pzz_draw_prize_id", using: :btree
  add_index "pzz_draw_histories", ["pzz_user_id"], name: "index_pzz_draw_histories_on_pzz_user_id", using: :btree

  create_table "pzz_draw_prizes", force: true do |t|
    t.integer  "pzz_draw_config_id", default: 0,  null: false
    t.string   "place",              default: "", null: false
    t.string   "place_name",         default: "", null: false
    t.integer  "min_degree",         default: 0,  null: false
    t.integer  "max_degree",         default: 0,  null: false
    t.string   "prize_content",      default: "", null: false
    t.integer  "prize_stock",        default: 0,  null: false
    t.integer  "winning_chance",     default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_draw_prizes", ["pzz_draw_config_id"], name: "index_pzz_draw_prizes_on_pzz_draw_config_id", using: :btree

  create_table "pzz_driver_identities", force: true do |t|
    t.integer  "pzz_user_id",                    default: 0,  null: false
    t.string   "user_realname",                  default: "", null: false
    t.string   "identity_dl_no",                 default: "", null: false
    t.string   "identity_dl_image_file_name"
    t.string   "identity_dl_image_content_type"
    t.integer  "identity_dl_image_file_size"
    t.datetime "identity_dl_image_updated_at"
    t.integer  "identity_dl_type",               default: 0,  null: false
    t.datetime "identity_dl_issued",                          null: false
    t.integer  "identity_dl_status",             default: 0,  null: false
    t.integer  "identity_status",                default: 0,  null: false
    t.text     "indentity_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_driver_identities", ["pzz_user_id"], name: "index_pzz_driver_identities_on_pzz_user_id", using: :btree

  create_table "pzz_identities", force: true do |t|
    t.integer  "pzz_user_id",                 default: 0,  null: false
    t.string   "user_realname",               default: "", null: false
    t.integer  "user_gender",                 default: 0,  null: false
    t.string   "identity_card_no",            default: "", null: false
    t.string   "identity_image_file_name"
    t.string   "identity_image_content_type"
    t.integer  "identity_image_file_size"
    t.datetime "identity_image_updated_at"
    t.integer  "identity_status",             default: 0,  null: false
    t.text     "identity_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_identities", ["pzz_user_id"], name: "index_pzz_identities_on_pzz_user_id", unique: true, using: :btree

  create_table "pzz_lines", force: true do |t|
    t.integer  "pzz_user_id",                                          default: 0,     null: false
    t.string   "user_nickname",                                        default: "",    null: false
    t.string   "user_realname",                                        default: "",    null: false
    t.string   "user_phone",                                           default: "",    null: false
    t.string   "user_email",                                           default: "",    null: false
    t.integer  "user_type",                                            default: 0,     null: false
    t.integer  "line_type",                                            default: 0,     null: false
    t.datetime "line_depart_datetime",                                                 null: false
    t.integer  "line_return",                                          default: 0,     null: false
    t.datetime "line_return_datetime",                                                 null: false
    t.integer  "line_participants",                                    default: 0,     null: false
    t.integer  "line_participants_available",                          default: 0,     null: false
    t.integer  "line_status",                                          default: 0,     null: false
    t.decimal  "line_price",                  precision: 11, scale: 2, default: 0.0,   null: false
    t.string   "line_depart_city",                                     default: "",    null: false
    t.string   "line_depart_address",                                  default: "",    null: false
    t.string   "line_depart_gps",                                      default: "0,0", null: false
    t.string   "line_dest_city",                                       default: "",    null: false
    t.string   "line_dest_address",                                    default: "",    null: false
    t.string   "line_dest_gps",                                        default: "0,0", null: false
    t.text     "line_midway"
    t.decimal  "line_milleage",               precision: 11, scale: 2, default: 0.0,   null: false
    t.integer  "line_elapse",                                          default: 0,     null: false
    t.decimal  "line_fuel",                   precision: 11, scale: 2, default: 0.0,   null: false
    t.datetime "line_expire_datetime",                                                 null: false
    t.integer  "line_plan_type",                                       default: 0,     null: false
    t.string   "line_week_day",                                        default: "",    null: false
    t.text     "line_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_lines", ["line_depart_datetime", "line_depart_gps", "line_dest_gps"], name: "by_line_addresses", using: :btree
  add_index "pzz_lines", ["pzz_user_id"], name: "index_pzz_lines_on_pzz_user_id", using: :btree

  create_table "pzz_links", force: true do |t|
    t.integer  "pzz_user_id",             default: 0,  null: false
    t.string   "link_url",                default: "", null: false
    t.string   "link_name",               default: "", null: false
    t.string   "link_image_file_name"
    t.string   "link_image_content_type"
    t.integer  "link_image_file_size"
    t.datetime "link_image_updated_at"
    t.string   "link_target",             default: "", null: false
    t.string   "link_description",        default: "", null: false
    t.integer  "link_visible",            default: 0,  null: false
    t.integer  "link_rating",             default: 0,  null: false
    t.string   "link_rel",                default: "", null: false
    t.text     "link_notes"
    t.string   "link_rss",                default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_links", ["pzz_user_id"], name: "index_pzz_links_on_pzz_user_id", using: :btree

  create_table "pzz_messages", force: true do |t|
    t.integer  "from_user_id",       default: 0,  null: false
    t.integer  "to_user_id",         default: 0,  null: false
    t.string   "from_user_nickname", default: "", null: false
    t.string   "message_subject",    default: "", null: false
    t.string   "message_content",    default: "", null: false
    t.integer  "message_folder",     default: 0,  null: false
    t.integer  "message_related_id", default: 0,  null: false
    t.integer  "message_status",     default: 0,  null: false
    t.integer  "message_type",       default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_messages", ["from_user_id", "to_user_id"], name: "index_pzz_messages_on_from_user_id_and_to_user_id", unique: true, using: :btree
  add_index "pzz_messages", ["from_user_id"], name: "index_pzz_messages_on_from_user_id", using: :btree
  add_index "pzz_messages", ["to_user_id"], name: "index_pzz_messages_on_to_user_id", using: :btree

  create_table "pzz_options", force: true do |t|
    t.string   "option_name",  default: "", null: false
    t.text     "option_value"
    t.integer  "autoload",     default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pzz_orders", force: true do |t|
    t.string   "order_no",           default: "",  null: false
    t.integer  "passenger_id",       default: 0,   null: false
    t.string   "driver_id",          default: "0", null: false
    t.integer  "pzz_line_id",        default: 0,   null: false
    t.string   "passenger_nickname", default: "",  null: false
    t.string   "passenger_realname", default: "",  null: false
    t.string   "passenger_phone",    default: "",  null: false
    t.string   "passenger_email",    default: "",  null: false
    t.string   "driver_nickname",    default: "",  null: false
    t.string   "driver_realname",    default: "",  null: false
    t.string   "driver_phone",       default: "",  null: false
    t.string   "driver_email",       default: "",  null: false
    t.integer  "order_participants", default: 0,   null: false
    t.integer  "order_status",       default: 0,   null: false
    t.text     "order_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_orders", ["driver_id"], name: "index_pzz_orders_on_driver_id", using: :btree
  add_index "pzz_orders", ["order_no"], name: "index_pzz_orders_on_order_no", unique: true, using: :btree
  add_index "pzz_orders", ["passenger_id", "driver_id"], name: "index_pzz_orders_on_passenger_id_and_driver_id", using: :btree
  add_index "pzz_orders", ["passenger_id"], name: "index_pzz_orders_on_passenger_id", using: :btree
  add_index "pzz_orders", ["pzz_line_id"], name: "index_pzz_orders_on_pzz_line_id", using: :btree

  create_table "pzz_pay_histories", force: true do |t|
    t.integer  "pzz_user_id",                                 default: 0,   null: false
    t.string   "pay_transaction_no",                          default: "",  null: false
    t.integer  "pay_method",                                  default: 0,   null: false
    t.decimal  "pay_amount",         precision: 11, scale: 2, default: 0.0, null: false
    t.integer  "pay_currency",                                default: 0,   null: false
    t.string   "pay_description",                             default: "",  null: false
    t.string   "pay_status",                                  default: "0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_pay_histories", ["pzz_user_id"], name: "index_pzz_pay_histories_on_pzz_user_id", using: :btree

  create_table "pzz_post_meta", force: true do |t|
    t.integer  "pzz_post_id",    default: 0,  null: false
    t.string   "postmeta_key",   default: "", null: false
    t.text     "postmeta_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_post_meta", ["pzz_post_id"], name: "index_pzz_post_meta_on_pzz_post_id", using: :btree

  create_table "pzz_posts", force: true do |t|
    t.integer  "pzz_user_id",                              default: 0,  null: false
    t.string   "post_title",                               default: "", null: false
    t.string   "post_name",                                default: "", null: false
    t.text     "post_content",          limit: 2147483647
    t.text     "post_excerpt"
    t.integer  "post_status",                              default: 0,  null: false
    t.integer  "comment_status",                           default: 0,  null: false
    t.text     "post_content_filtered"
    t.integer  "comment_count",                            default: 0,  null: false
    t.integer  "post_order",                               default: 0,  null: false
    t.string   "post_guid",                                default: "", null: false
    t.text     "to_ping"
    t.text     "pinged"
    t.integer  "ping_status",                              default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_posts", ["pzz_user_id"], name: "index_pzz_posts_on_pzz_user_id", using: :btree

  create_table "pzz_sms_histories", force: true do |t|
    t.integer  "pzz_user_id", default: 0,  null: false
    t.string   "user_phone",  default: "", null: false
    t.string   "sms_subject", default: "", null: false
    t.string   "sms_content", default: "", null: false
    t.integer  "sms_status",  default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_sms_histories", ["pzz_user_id"], name: "index_pzz_sms_histories_on_pzz_user_id", using: :btree

  create_table "pzz_templates", force: true do |t|
    t.string   "template_key",   default: "", null: false
    t.text     "template_value"
    t.integer  "template_type",  default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pzz_term_relationships", force: true do |t|
    t.integer  "object_id",            default: 0, null: false
    t.integer  "pzz_term_taxonomy_id", default: 0, null: false
    t.integer  "term_order",           default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_term_relationships", ["object_id"], name: "index_pzz_term_relationships_on_object_id", using: :btree
  add_index "pzz_term_relationships", ["pzz_term_taxonomy_id"], name: "index_pzz_term_relationships_on_pzz_term_taxonomy_id", using: :btree

  create_table "pzz_term_taxonomies", force: true do |t|
    t.integer  "pzz_term_id",          default: 0,  null: false
    t.string   "taxonomy_name",        default: "", null: false
    t.string   "taxonomy_description", default: "", null: false
    t.integer  "taxonomy_parent_id",   default: 0,  null: false
    t.integer  "count",                default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_term_taxonomies", ["pzz_term_id"], name: "index_pzz_term_taxonomies_on_pzz_term_id", using: :btree

  create_table "pzz_terms", force: true do |t|
    t.string   "term_name",     default: "", null: false
    t.string   "term_slug",     default: "", null: false
    t.integer  "term_group_id", default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pzz_traffics", force: true do |t|
    t.integer  "pzz_user_id",                default: 0,  null: false
    t.integer  "traffic_keywords",           default: 0,  null: false
    t.string   "traffic_image_file_name"
    t.string   "traffic_image_content_type"
    t.integer  "traffic_image_file_size"
    t.datetime "traffic_image_updated_at"
    t.string   "traffic_description",        default: "", null: false
    t.string   "traffic_gps",                default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_traffics", ["pzz_user_id"], name: "index_pzz_traffics_on_pzz_user_id", using: :btree

  create_table "pzz_user_draws", force: true do |t|
    t.integer  "pzz_user_id",        default: 0, null: false
    t.integer  "pzz_draw_config_id", default: 0, null: false
    t.integer  "draw_count",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_user_draws", ["pzz_draw_config_id"], name: "index_pzz_user_draws_on_pzz_draw_config_id", using: :btree
  add_index "pzz_user_draws", ["pzz_user_id"], name: "index_pzz_user_draws_on_pzz_user_id", using: :btree

  create_table "pzz_user_meta", force: true do |t|
    t.integer  "pzz_user_id",    default: 0, null: false
    t.string   "usermeta_key"
    t.text     "usermeta_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pzz_users", force: true do |t|
    t.string   "email",                    default: "",  null: false
    t.string   "encrypted_password",       default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",          default: 0,   null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "user_phone",               default: "",  null: false
    t.string   "user_nickname",            default: "",  null: false
    t.string   "user_avatar_file_name"
    t.string   "user_avatar_content_type"
    t.integer  "user_avatar_file_size"
    t.datetime "user_avatar_updated_at"
    t.string   "user_url",                 default: "",  null: false
    t.text     "user_description"
    t.integer  "user_status",              default: 0,   null: false
    t.string   "user_display_name",        default: "",  null: false
    t.integer  "user_age",                 default: 0,   null: false
    t.integer  "user_msg_count",           default: 10,  null: false
    t.integer  "user_grade",               default: 0,   null: false
    t.string   "user_contact_prefer",      default: "0", null: false
    t.integer  "user_satisfaction_rating", default: 0,   null: false
    t.integer  "user_breach_rating",       default: 0,   null: false
    t.integer  "user_pz_count",            default: 0,   null: false
    t.string   "user_qq",                  default: "",  null: false
    t.integer  "user_group_id",            default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pzz_users", ["confirmation_token"], name: "index_pzz_users_on_confirmation_token", unique: true, using: :btree
  add_index "pzz_users", ["email"], name: "index_pzz_users_on_email", unique: true, using: :btree
  add_index "pzz_users", ["reset_password_token"], name: "index_pzz_users_on_reset_password_token", unique: true, using: :btree
  add_index "pzz_users", ["unlock_token"], name: "index_pzz_users_on_unlock_token", unique: true, using: :btree
  add_index "pzz_users", ["user_phone"], name: "index_pzz_users_on_user_phone", unique: true, using: :btree

  create_table "pzz_users_roles", id: false, force: true do |t|
    t.integer "pzz_user_id"
    t.integer "role_id"
  end

  add_index "pzz_users_roles", ["pzz_user_id", "role_id"], name: "index_pzz_users_roles_on_pzz_user_id_and_role_id", using: :btree

  create_table "rich_rich_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        default: "file"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
