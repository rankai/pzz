class DeviseCreatePzzUsers < ActiveRecord::Migration
  def change
    create_table(:pzz_users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      # pzz fields
      # user virtual accessor user_login
      # t.string    :user_login,                default: "",  null: false
      t.string      :user_phone,                default: "",  null: false
      t.string      :user_nickname,             default: "",  null: false
      t.attachment  :user_avatar
      t.string      :user_url,                  default: "",  null: false
      t.text        :user_description
      t.integer     :user_status,               default: 0,   null: false
      t.string      :user_display_name,         default: "",  null: false
      t.integer     :user_age,                  default: 0,   null: false
      t.integer     :user_msg_count,            default: 10,  null: false
      t.integer     :user_grade,                default: 0,   null: false
      t.string      :user_contact_prefer,       default: 0,   null: false
      t.integer     :user_satisfaction_rating,  default: 0,   null: false
      t.integer     :user_breach_rating,        default: 0,   null: false
      t.integer     :user_pz_count,             default: 0,   null: false
      t.string      :user_qq,                   default: "",  null: false
      t.integer     :user_group_id,             default: 0,   null: false
      



      t.timestamps
    end

    add_index :pzz_users, :email,                unique: true
   #add_index :pzz_users, :user_login,           unique: true
    add_index :pzz_users, :user_phone,           unique: true
    add_index :pzz_users, :reset_password_token, unique: true
    add_index :pzz_users, :confirmation_token,   unique: true
    add_index :pzz_users, :unlock_token,         unique: true
  end
end
