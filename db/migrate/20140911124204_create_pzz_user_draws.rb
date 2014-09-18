class CreatePzzUserDraws < ActiveRecord::Migration
  def change
    create_table :pzz_user_draws do |t|
      t.integer :pzz_user_id,                  null: false, default: 0
      t.integer :pzz_draw_config_id,           null: false, default: 0
      t.integer :draw_count,                   null: false, default: 0

      t.timestamps
    end
    add_index :pzz_user_draws, :pzz_user_id
    add_index :pzz_user_draws, :pzz_draw_config_id
  end
end
