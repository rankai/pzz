class PzzOrder < ActiveRecord::Base


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

end
