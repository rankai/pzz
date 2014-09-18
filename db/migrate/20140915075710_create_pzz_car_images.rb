class CreatePzzCarImages < ActiveRecord::Migration
  def change
    create_table :pzz_car_images do |t|
      t.integer :pzz_car_id,	null: false, default: 0
      t.attachment :car_image

      t.timestamps
    end
    add_index :pzz_car_images, :pzz_car_id
  end
end
