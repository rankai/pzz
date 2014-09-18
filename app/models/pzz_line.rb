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

end
