class CreatePzzCars < ActiveRecord::Migration
  def change
    create_table :pzz_cars do |t|
      t.integer :pzz_user_id,                   null: false, default: 0
      t.integer :pzz_driver_identity_id,        null: false, default: 0
      t.string :user_realname,                  null: false, default: ""
      t.integer :car_type,                      null: false, default: 0
      t.string :car_brand_name,                 null: false, default: ""
      t.integer :car_seats,                     null: false, default: 0
      t.string :car_plate_no,                   null: false, default: ""
      t.string :car_vin,                        null: false, default: ""
      t.string :car_engine_no,                  null: false, default: ""
      t.string :identity_vl_no,                 null: false, default: ""
      t.attachment :identity_vl_image
      t.datetime :identity_vl_issued,           null: false, default: '0000-00-00 00:00:00'
      t.string :insurance_corporate,            null: false, default: ""
      t.string :insurance_no,                   null: false, default: ""
      t.datetime :insurance_expired,            null: false, default: '0000-00-00 00:00:00'
      t.attachment :insurance_image
      t.integer :identity_status,               null: false, default: 0
      t.text :identity_remark

      t.timestamps
    end
    add_index :pzz_cars, :pzz_user_id
    add_index :pzz_cars, :pzz_driver_identity_id
  end
end