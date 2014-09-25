class PzzPayHistory < ActiveRecord::Base

	# version trail	
	has_paper_trail

	# fields

	enum pay_status: [:wait, :success, :closed, :pending, :finished ]
	# wait 等待买家付款
	# closed 交易关闭
	# success 交易成功，且可退款
	# pendding 等待卖家收款（买家付款后，如果卖家账号被冻结）
	# finished 交易成功且结束，即不可再做任何操作

	# validates


	# relationships
	belongs_to :pzz_user


end
