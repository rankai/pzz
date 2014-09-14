class CreatePzzSmsHistories < ActiveRecord::Migration
  def change
    create_table :pzz_sms_histories do |t|
      t.integer :pzz_user_id,           null: false, default: 0
      #t.integer :pzz_template_id,       null: false, default: 0
      t.string :user_phone,         null: false, default: ""
      t.string :sms_subject,        null: false, default: ""
      t.string :sms_content,        null: false, default: ""
      t.integer :sms_status,        null: false, default: 0

      t.timestamps
    end
    add_index :pzz_sms_histories, :pzz_user_id
  end
end
