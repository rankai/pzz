class CreatePzzLinks < ActiveRecord::Migration
  def change
    create_table :pzz_links do |t|
      t.integer :pzz_user_id,         null: false, default: 0
      t.string :link_url,             null: false, default: ""
      t.string :link_name,            null: false, default: ""
      t.attachment :link_image
      t.string :link_target,          null: false, default: ""
      t.string :link_description,     null: false, default: ""
      t.integer :link_visible,        null: false, default: 0
      t.integer :link_rating,         null: false, default: 0
      t.string :link_rel,             null: false, default: ""
      t.text :link_notes
      t.string :link_rss,             null: false, default: ""

      t.timestamps
    end
    add_index :pzz_links, :pzz_user_id
  end
end
