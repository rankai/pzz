class CreatePzzTermRelationships < ActiveRecord::Migration
  def change
    create_table :pzz_term_relationships do |t|
      t.integer :object_id,               null: false, default: 0
      t.integer :pzz_term_taxonomy_id,    null: false, default: 0
      t.integer :term_order,              null: false, default: 0

      t.timestamps
    end
    add_index :pzz_term_relationships, :object_id
    add_index :pzz_term_relationships, :pzz_term_taxonomy_id
  end
end
