class CreatePzzPayHistories < ActiveRecord::Migration
  def change
    create_table :pzz_pay_histories do |t|
      t.integer :pzz_user_id,               null: false, default: 0
      t.string :pay_transaction_no,         null: false, default: ""
      t.integer :pay_method,                null: false, default: 0
      t.decimal :pay_amount,                null: false, default: 0.00, precision: 11, scale: 2  
      t.integer :pay_currency,              null: false, default: 0
      t.string :pay_description,            null: false, default: ""
      t.string :pay_status,                 null: false, default: 0

      t.timestamps
    end
    add_index :pzz_pay_histories, :pzz_user_id
  end
end
