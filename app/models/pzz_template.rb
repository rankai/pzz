class PzzTemplate < ActiveRecord::Base

	# fields 
	enum template_type: [:sms, :pms, :pz, :system]
	# sms 短信模板
	# pms 站内消息模板
	# pz 拼车说明模板
	# system 系统消息模板


	# validates



	# relationships

end
