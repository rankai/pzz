class PzzDrawConfig < ActiveRecord::Base


	# fields

	enum user_filter: [:all_users]
	# all

	enum draw_type: [:circle, :scratch, :slot]
	# Circle 转盘 
	# Scratch 呱呱乐
	# Slot 老虎机


	enum draw_status: [:not_start, :in_progress, :completed, :pending]
	# Not_start 未开始
	# In_process 进行中
	# Completed 完成
	# Pending 停止


	# validates


	# relationships
	has_many :pzz_draw_prizes


end
