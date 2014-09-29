class PzzOrder < ActiveRecord::Base

	after_save 		:notice_new_order
	after_update 	:notice_order_confirmed


	# fields
	enum order_status: [:received, :confirmed, :pending, :canceled]
	#received 创建/收到订单
	#confirmed 订单确认（用户或司机同意）
	#pending 挂起
	#canceled 取消

	# version trail	
	has_paper_trail

	# validates


	# relationships
	belongs_to :pzz_user, foreign_key: "passenger_id"
	belongs_to :pzz_user, foreign_key: "driver_id"
	belongs_to :pzz_line

	#def self.restricted_statuses
    #	order_status.except :received, :canceled
  	#end

  	def self.create_order(line, applier, line_participants) # applier 申请人

  		receiver = line.pzz_user
		order = nil
		driver_line = nil
		car = nil

		order_no = "p_zo_#{Time.now.to_i}"

		# 乘客申请加入拼车
  		if line.driver?

  			# 判断是否有足够的剩余座位
  			if line.line_participants_available < line_participants
  				return 405
  			end

  			# 判断乘客是否已经完成实名认证
  			if applier.pzz_identity.nil?
  				return 405
  			end

  			order = PzzOrder.new(
  				order_no: order_no, 
  				pzz_line_id: line.id, 
  				passenger_id: applier.id, 
  				passenger_nickname: applier.user_nickname,
  				passenger_phone: applier.user_phone, 
  				passenger_email: applier.email,
  				driver_id: receiver.id, 
  				driver_nickname: receiver.user_nickname, 
  				driver_phone: receiver.user_phone, 
  				driver_email: receiver.email,
  				order_participants: line_participants, 
  				order_status: PzzOrder.order_statuses[:received],
  				order_remark: line.line_remark
  				)
  			driver_line = line
  		# 司机邀请乘客加入拼车
  		else

  			# 判断是否是司机：完成驾驶认证和车辆认证
  			if applier.pzz_driver_identity.nil? || applier.pzz_car.nil?
  				return 405
  			end

  			# 判断司机的车辆是否有足够的座位
  			car = applier.pzz_car
  			if car.car_seats < line.line_participants
  				return 405
  			end

  			# 匹配符合乘客线路的司机线路
  			driver_line = PzzLine.match_line(line, applier)

  			if driver_line.nil?
  				return 500
  			end

  			order = PzzOrder.new(
  				order_no: order_no, 
  				pzz_line_id: driver_line.id, 
  				passenger_id: receiver.id, 
  				passenger_nickname: receiver.user_nickname,
  				passenger_phone: receiver.user_phone, 
  				passenger_email: receiver.email,
  				driver_id: applier.id, 
  				driver_nickname: applier.user_nickname, 
  				driver_phone: applier.user_phone, 
  				driver_email: applier.email,
  				order_participants: line.line_participants, 
  				order_status: PzzOrder.order_statuses[:received],
  				order_remark: line.line_remark
  				)
  		end

  		if order.save?
  			driver_line.update_attributes(line_participants_available: 
  				(driver_line.line_participants_available - line_participants))
  		end

  		return order
  		
  	end

  	def notice_new_order
  		to_user = nil
  		subject = "拼车提醒"
  		content = ""
  		# PzzMessage.send_system_message(to_user, subject, content)
  	end

  	def notice_order_confirmed
  		if self.confirmed?
  		end
  	end

end
