class CreatePzzTermTaxonomies < ActiveRecord::Migration
  def change
    create_table :pzz_term_taxonomies do |t|
      t.integer :pzz_term_id,           null: false, default: 0
      t.string :taxonomy_name,          null: false, default: ""
      t.string :taxonomy_description,   null: false, default: ""
      t.integer :taxonomy_parent_id,    null: false, default: 0
      t.integer :count,                 null: false, default: 0

      t.timestamps
    end
    add_index :pzz_term_taxonomies, :pzz_term_id
  end
end
