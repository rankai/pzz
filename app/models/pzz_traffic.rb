class PzzTraffic < ActiveRecord::Base

	# fields
	enum traffic_keywords: [:smooth, :slow, :jam]
	# smooth 畅通
	# slow 缓行
	# jam 拥堵

	has_attached_file :traffic_image, 
	    :styles => {:medium => "640x640>" },
	    :convert_options => {
	        :medium => "-strip -interlace Plane -quality 85%"
	    },
	    :processors => [:thumbnail, :compression]


	# validate
	validates_attachment :traffic_image,
	    :content_type => { :content_type => /\Aimage\/.*\Z/ },
	    :size => { :in => 0..500.kilobytes}

	# relationships
	belongs_to :pzz_user

end
