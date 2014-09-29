class PzzUser < ActiveRecord::Base
  rolify

  # You likely have this before callback set up for the token.
  before_save :ensure_authentication_token

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
  has_attached_file :user_avatar, :styles => { :medium => "100x100#", :thumb => "50x50#" }, 
  :default_url => "/images/:style/head.jpg"

  # validates 
  validates_attachment :user_avatar,
  :content_type => { :content_type => /\Aimage\/.*\Z/ },
  :size => { :in => 0..500.kilobytes}

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
  has_one  :pzz_driver_identity, dependent: :destroy
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

  # omit email when using user_phone
  protected
    def email_required?
    false
  end


  def self.current
    Thread.current[:pzz_user]
  end
  def self.current=(user)
    Thread.current[:pzz_user] = user
  end


  # identity



  # sms

 
  # tokens
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
 
  private

  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless PzzUser.where(authentication_token: token).first
    end
  end


  public
  def make_image(name)
    file = File.join("#{name}")
    io = File.new(file)
    self.user_avatar = io
  end

  def crop_avatar(user, x, y, w, h)
    tmp_image = "#{Rails.root}/tmp/" + "#{Time.now.to_i}#{Time.now.to_i}.png"
    avatar = "#{Rails.root}/public" + "#{user.user_avatar.url}".split("?")[0]
    system "convert \"#{avatar}\" -crop #{w}x#{h}+#{x}+#{y} \"#{tmp_image}\""
    make_image(tmp_image)
  end

  # to_json 获取正确的url
  def user_avatar_url
    user_avatar.url(:medium)
  end

end
