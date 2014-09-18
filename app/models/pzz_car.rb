class PzzCar < ActiveRecord::Base

  # fields
  # SUV 城市越野车
  # Sports 跑车
  # MPV 多功能用途车
  # MINI 迷你轿车
  # Compact 小型轿车
  # Family 中级轿车
  # Bus 小型客车
  # Luxury 豪华轿车
  enum car_type: [:COMPACT, :FAMILY, :MINI, :LUXURY, :SUV, :MPV, :SPORTS, :BUS]

  enum identity_status: [:pending, :confirmed, :failed]
  # Pending 审核中
  # Confirmed 已生效
  # Failed 认证失败

  has_attached_file :identity_vl_image, 
    :styles => {:medium => "640x640>" },
    :convert_options => {
        :medium => "-strip -interlace Plane -quality 85%"
    },
    :processors => [:thumbnail, :compression]

  has_attached_file :insurance_image, 
    :styles => {:medium => "640x640>" },
    :convert_options => {
        :medium => "-strip -interlace Plane -quality 85%"
    },
    :processors => [:thumbnail, :compression]

  
  # validates 
  validates_attachment :identity_vl_image,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..500.kilobytes}

  validates_attachment :insurance_image,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..500.kilobytes}



  # relationships
  belongs_to :pzz_user
  belongs_to :pzz_driver_identity
  has_many :pzz_car_images, dependent: :destroy

end

