class PzzLine < ActiveRecord::Base


  	after_update :close_if_participants_zero

	# fields
	
	enum line_return: [:no, :yes]
	# no 无返程
	# yes 返程

	enum line_type: [:local, :long_distance]
	# local 同城/上下班
	# long_distance 长途拼车

	enum line_status: [:open, :closed, :expired, :canceled]
	# open 创建
	# closed 关闭（人满或手动关闭）
	# expired 过期
	# canceled 取消

	enum line_plan_type: [:one_off, :long_term]
	# one_off 临时
	# long_term 长期计划

	enum user_type: [:passenger, :driver]
	# passenger 乘客
	# driver 司机


	# validates

	# relationships
	belongs_to :pzz_user
	has_many :pzz_orders, dependent: :nullify


	protected 

	def self.tell_line(line)
		template = nil
		line_intro = ''
		if line.driver?
			template = PzzTemplate.where(template_type: PzzTemplate.pz, 
				template_key: 'driver').first
		else
			template = PzzTemplate.where(template_type: PzzTemplate.pz, 
				template_key: 'passenger').first
		end

		format = '%Y-%m-%d %H:%M:%S'

		line_intro = template.template_value
		line_intro = line_intro.gsub('{user_nickname}', line.user_nickname)
		line_intro = line_intro.gsub('{line_created}', line.created_at.to_s(format).delete('UTC'))
		line_intro = line_intro.gsub('{line_depart_datetime}', line.line_depart_datetime.to_s(format).delete('UTC'))
		line_intro = line_intro.gsub('{line_depart_address}', "#{line.line_depart_city} #{line.line_depart_address}")
		line_intro = line_intro.gsub('{line_dest_address}', "#{line.line_dest_city} #{line.line_dest_address}")

		if line_intro.include? 'line_participants_avaiable'
			line_intro = line_intro.gsub('{line_participants_available}', line.line_participants_available.to_s)
		else
			line_intro = line_intro.gsub('{line_participants}', line.line_participants.to_s)
		end
		
		line_intro = line_intro.gsub('{line_price}', line.line_price.to_s)
		line_intro = line_intro.gsub('{line_milleage}', line.line_milleage.to_s)
		line_intro = line_intro.gsub('{line_elapse}', line.line_elapse.to_s)

		line_intro
	end


	# 到这里执行时拼车者已拼车认证和有足够座位数
	def self.match_line(passenger_line, driver)

		# has a line match ?
		driver_line = PzzLine.where(line_depart_gps: passenger_line.line_depart_gps, 
			line_dest_gps: passenger_line.line_dest_gps).first || PzzLine.where(line_depart_city: passenger_line.line_depart_city,
			line_depart_address: passenger_line.line_depart_address,
			line_dest_city: passenger_line.line_dest_city, line_dest_address: passenger_line.line_dest_address)

		if not driver_line.nil?
			return driver_line
		end

		# create a new line to match
		# 自动创建匹配乘客需求的路线
		driver_line = passenger_line.dup
  		driver_line.pzz_user = driver
  		car_seats = driver.pzz_car.car_seats
  		if driver_line.update_attributes(user_type: PzLine.user_types[:driver], 
  			line_participants_available: car_seats, 
  			line_participants: car_seats)
  			return driver_line
  		else
  			return nil
  		end
	end


	private

	def close_if_participants_zero

		if self.canceled?
			return
		end

		if self.line_participants_available == 0 && (not self.closed?)
			self.closed!
		elsif self.line_participants_available !=0 && self.closed?
			self.created!
		end
	end

end
