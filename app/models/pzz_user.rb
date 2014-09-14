class PzzUser < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable #,:confirmable

  # fields
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  enum user_status: [:active, :disabled, :locked]
  enum user_contact_prefer: [:email, :phone, :both]
  enum user_grade: [:low, :middle, :high]
  has_attached_file :user_avatar, :styles => { :medium => "240x240>", :thumb => "120x120>" }, :default_url => ""
  before_post_process :skip_for_audio


  # validates 
  validates_attachment :user_avatar,
  :content_type => { :content_type => "image/jpeg" },
  :size => { :in => 0..10.kilobytes}

  validates :user_phone, 
      :uniqueness => {
        :case_sensitive => false
      }#, 
      #:format => {}

  # relationships
  has_many :pzz_user_metas, dependent: :destroy 
  has_many :pzz_lines, dependent: :nullify
  has_many :driver_orders, foreign_key: "driver_id", class_name: "PzzOrder", dependent: :nullify
  has_many :passenger_orders, foreign_key: "passenger_id", class_name: "PzzOrder", dependent: :nullify
  has_one  :pzz_car, dependent: :destroy
  has_one  :pzz_identity, dependent: :destroy
  has_many :pzz_sms_histories, dependent: :nullify
  has_many :pzz_traffics, dependent: :nullify
  has_many :sent_messages, foreign_key: "from_user_id", class_name: "PzzMessage"
  has_many :received_messages, foreign_key: "to_user_id", class_name: "PzzMessage"
  has_many :pzz_lines, dependent: :destroy
  has_many :pzz_comments, dependent: :nullify
  has_many :pzz_posts, dependent: :nullify


  # overrides
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(user_phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  

  def skip_for_audio
    ! %w(audio/ogg application/ogg).include?(user_avatar_content_type)
  end



  # identity



  # sms



end
