class PzzLine < ActiveRecord::Base

	# fields
	
	enum line_return: [:no, :yes]
	# no 无返程
	# yes 返程

	enum line_type: [:local, :long_distance]
	# local 同城/上下班
	# long_distance 长途拼车

	enum line_status: [:created, :closed, :expired, :canceled]
	# created 创建
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
			line_intro = line_intro.gsub('{line_participants_avaiable}', line.line_participants_avaiable.to_s)
		else
			line_intro = line_intro.gsub('{line_participants}', line.line_participants.to_s)
		end
		
		line_intro = line_intro.gsub('{line_price}', line.line_price.to_s)
		line_intro = line_intro.gsub('{line_milleage}', line.line_milleage.to_s)
		line_intro = line_intro.gsub('{line_elapse}', line.line_elapse.to_s)

		line_intro
	end

end
