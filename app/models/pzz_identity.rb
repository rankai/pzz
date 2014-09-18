class PzzIdentity < ActiveRecord::Base

  after_update :assign_passenger_role

  #fields
  enum identity_gender: [:male, :female]
  # male
  # female

  enum identity_status: [:pending, :confirmed, :failed]
  # Pending 审核中
  # Confirmed 已生效
  # Failed 认证失败

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

  def assign_driver_role
    user = self.pzz_user
    if self.identity_status.confirmed?
      user.add_role 'passenger'
      # sent success message
    elsif self.identity_status.failed?
      # sent failed message
    end
  end

end