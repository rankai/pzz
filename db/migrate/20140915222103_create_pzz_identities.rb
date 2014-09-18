class CreatePzzIdentities < ActiveRecord::Migration
  def change
    create_table :pzz_identities do |t|
      t.integer :pzz_user_id,             null: false, default: 0
      t.string :user_realname,            null: false, default: ""
      t.integer :user_gender,             null: false, default: 0
      t.string :identity_card_no,         null: false, default: ""
      t.attachment :identity_image
      t.integer :identity_status,         null: false, default: 0
      t.text :identity_remark

      t.timestamps
    end
    add_index :pzz_identities, :pzz_user_id, unique: true
  end
end