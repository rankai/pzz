class CreatePzzTraffics < ActiveRecord::Migration
  def change
    create_table :pzz_traffics do |t|
      t.integer :pzz_user_id,                 null: false, default: 0
      t.integer :traffic_keywords,            null: false, default: 0
      t.attachment :traffic_image
      t.string :traffic_description,          null: false, default: ""
      t.string :traffic_gps,                  null: false, default: ""

      t.timestamps
    end
    add_index :pzz_traffics, :pzz_user_id
  end
end
