class CreatePzzLines < ActiveRecord::Migration
  def change
    create_table :pzz_lines do |t|
      t.integer :pzz_user_id,                     null: false, default: 0
      t.string :user_nickname,                    null: false, default: ""
      t.string :user_realname,                    null: false, default: ""
      t.string :user_phone,                       null: false, default: ""
      t.string :user_email,                       null: false, default: ""
      t.integer :user_type,                       null: false, default: 0
      t.integer :line_type,                       null: false, default: 0
      t.datetime :line_depart_datetime,           null: false, default: '0000-00-00 00:00:00'
      t.integer :line_return,                     null: false, default: 0
      t.datetime :line_return_datetime,           null: false, default: '0000-00-00 00:00:00'
      t.integer :line_participants,               null: false, default: 0
      t.integer :line_participants_available,     null: false, default: 0
      t.integer :line_status,                     null: false, default: 0
      t.decimal :line_price,                      null: false, default: 0.00, precision: 11, scale: 2
      t.string :line_depart_city,                 null: false, default: ""
      t.string :line_depart_address,              null: false, default: ""
      t.string :line_depart_gps,                  null: false, default: "0,0"
      t.string :line_dest_city,                   null: false, default: ""
      t.string :line_dest_address,                null: false, default: ""
      t.string :line_dest_gps,                    null: false, default: "0,0"
      t.text :line_midway
      t.decimal :line_milleage,                   null: false, default: 0.00, precision: 11, scale: 2
      t.integer :line_elapse,                     null: false, default: 0
      t.decimal :line_fuel,                       null: false, default: 0.00, precision: 11, scale: 2
      t.datetime :line_expire_datetime,           null: false, default: '0000-00-00 00:00:00'
      t.integer :line_plan_type,                  null: false, default: 0
      t.string :line_week_day,                    null: false, default: ""
      t.text :line_remark

      t.timestamps
    end

    add_index :pzz_lines, :pzz_user_id
    add_index :pzz_lines, [:line_depart_datetime, :line_depart_gps,
     :line_dest_gps], name: "by_line_addresses"

  end
end
