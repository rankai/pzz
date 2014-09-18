class CreatePzzDrawPrizes < ActiveRecord::Migration
  def change
    create_table :pzz_draw_prizes do |t|
      t.integer :pzz_draw_config_id,          null: false, default: 0
      t.string :place,                        null: false, default: ""
      t.string :place_name,                   null: false, default: ""
      t.integer :min_degree,                  null: false, default: 0
      t.integer :max_degree,                  null: false, default: 0
      t.string :prize_content,                null: false, default: ""
      t.integer :prize_stock,                 null: false, default: 0
      t.integer :winning_chance,              null: false, default: 0

      t.timestamps
    end
    add_index :pzz_draw_prizes, :pzz_draw_config_id
  end
end
