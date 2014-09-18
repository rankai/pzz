class PzzLink < ActiveRecord::Base

	# fields
	enum link_visible: [:yes, :no]

	has_attached_file :link_image, 
	    :styles => {:thumb => "50x50#" },
	    :convert_options => {
	        :thumb => "-strip -interlace Plane -quality 85%"
	    },
	    :processors => [:thumbnail, :compression]


	# validate
	validates_attachment :traffic_image,
	    :content_type => { :content_type => /\Aimage\/.*\Z/ },
	    :size => { :in => 0..10.kilobytes}

	# relationships


	def skip_for_audio
	   ! %w(audio/ogg application/ogg).include?(link_image_content_type)
	end

end
