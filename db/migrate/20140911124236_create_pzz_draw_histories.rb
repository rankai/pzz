class CreatePzzDrawHistories < ActiveRecord::Migration
  def change
    create_table :pzz_draw_histories do |t|
      t.integer :pzz_user_id,                 null: false, default: 0
      t.integer :pzz_draw_config_id,          null: false, default: 0
      t.integer :pzz_draw_prize_id,           null: false, default: 0
      t.string :user_nickname,                null: false, default: ""
      t.string :draw_title,                   null: false, default: ""
      t.string :prize_place_name,             null: false, default: ""
      t.string :prize_content,                null: false, default: ""
      t.integer :draw_status,                 null: false, default: 0

      t.timestamps
    end
    add_index :pzz_draw_histories, :pzz_user_id
    add_index :pzz_draw_histories, :pzz_draw_config_id
    add_index :pzz_draw_histories, :pzz_draw_prize_id
  end
end
