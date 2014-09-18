class PzzCarImage < ActiveRecord::Base
	before_create :randomize_file_name  

	# fields
	has_attached_file :car_image, 
		:styles => {:medium => "640x640>" },
		:convert_options => {
		  	:medium => "-strip -interlace Plane -quality 85%"
		},
 		:processors => [:thumbnail, :compression]


	# validate
	validates_attachment :car_image,
	  :content_type => { :content_type => /\Aimage\/.*\Z/ },
	  :size => { :in => 0..500.kilobytes}

	# relationships 
	belongs_to :pzz_car

	private  
	def randomize_file_name  
	    #archives 就是你在 has_attached_file :archives 使用的名字  
	    extension = File.extname(car_image_file_name).downcase  
	   	#你可以改成你想要的文件名，把下面这个方法的第二个参数随便改了就可以了。  
	    self.car_image.instance_write(:file_name, "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(1000)}#{extension}")  
	end  

	public
	def make_image(name)
		#Dir.tmpdir
		file = File.join("#{name}")
		io = File.new(file)
		self.car_image = io
	end
end
