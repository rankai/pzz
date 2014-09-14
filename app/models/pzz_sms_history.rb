class PzzSmsHistory < ActiveRecord::Base

	# version trail	
	has_paper_trail

	# fields
	enum sms_status: [:pending, :success, :failed]
	# pending 等待发送
	# success 发送成功
	# failed 发送失败


	# validates


	# relationships
	belongs_to :pzz_user


	
	public

	# 
	def self.record(user_id, mobile, content, status)
		PzzSmsHistory.create(pzz_user_id: user_id, pzz_template_id: 0, 
			user_phone: mobile, sms_content: content, sms_status: status)
	end

end
