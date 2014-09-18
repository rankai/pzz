class PzzDriverIdentity < ActiveRecord::Base
  after_update :assign_driver_role

  #fields

  enum identity_dl_status: [:normal, :expired, :canceled]
  # normal 正常
  # expired 过期
  # canceled 注销

  enum identity_status: [:pending, :confirmed, :failed]
  # Pending 审核中
  # Confirmed 已生效
  # Failed 认证失败


  enum identity_dl_type: [:A, :B, :C]

  has_attached_file :identity_image, 
    :styles => {:medium => "640x640>" },
    :convert_options => {
        :medium => "-strip -interlace Plane -quality 85%"
    },
    :processors => [:thumbnail, :compression]

  # validate
  validates_attachment :identity_image,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..500.kilobytes}

  # relationships
  belongs_to :pzz_user
  has_one :pzz_car

  def assign_driver_role
    user = self.pzz_user
    if self.identity_status.confirmed?
      user.add_role 'driver'
      # sent success message
    elsif self.identity_status.failed?
      # sent failed message
    end
  end

end