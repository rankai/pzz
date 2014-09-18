class CreatePzzDriverIdentities < ActiveRecord::Migration
  def change
    create_table :pzz_driver_identities do |t|
      t.integer :pzz_user_id,               null: false, default: 0
      t.string :user_realname,              null: false, default: ""
      t.string :identity_dl_no,             null: false, default: ""
      t.attachment :identity_dl_image
      t.integer :identity_dl_type,          null: false, default: 0
      t.datetime :identity_dl_expired,      null: false, default: '0000-00-00 00:00:00'
      t.integer :identity_dl_status,        null: false, default: 0
      t.integer :identity_status,           null: false, default: 0
      t.text :indentity_remark

      t.timestamps
    end
    add_index :pzz_driver_identities, :pzz_user_id
  end
end
