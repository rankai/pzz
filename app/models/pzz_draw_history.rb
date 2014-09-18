class PzzDrawHistory < ActiveRecord::Base


	# fields

	enum draw_status: [:missed, :won, :issued]
	# Missed 未中奖
	# Won 中奖
	# Issued 已发放奖品


	# validates



	# relationships
	belongs_to :pzz_draw_config
	belongs_to :pzz_draw_prize
	belongs_to :pzz_user

end
