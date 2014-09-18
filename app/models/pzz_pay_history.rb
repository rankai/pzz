class PzzPayHistory < ActiveRecord::Base

	# version trail	
	has_paper_trail

	# fields

	enum pay_status: [:pending, :success, :failed]
	# pending 等待
	# success 充值成功
	# failed 充值失败

	# validates


	# relationships
	belongs_to :pzz_user


end
