class PzzMessage < ActiveRecord::Base

	# fields
	enum message_status: [:unread, :read, :deleted]
	# unread 未读
	# read 已读
	# deleted 已删除

	enum message_type: [:system, :user, :broadcast]
	# system 系统通知
	# user 私信
	# broadcast 系统广播

	enum message_folder: [:inbox, :outbox]
	# inbox 收件箱
	# outbox 发件箱

	# validates



	# relationships
	belongs_to :pzz_user, foreign_key: "from_user_id"
	belongs_to :pzz_user, foreign_key: "to_user_id"


	protected 

	# 目前不支持分组消息发送

	# 用户发私信
	def send_user_message(from_user, to_user, subject, content)
		message = PzzMessage.new(
			message_subject: subject, 
			message_content: content,
			message_folder: 1, 
			message_type: PzzMessage.message_types[:system], 
			message_status: 0,
			from_user_id: from_user.id
			to_user_id: to_user.id,
			from_user_nickname: from_user.nickname
			)

		if message.save?
			return 200
		else
			return 500
		end
	end

	# 发送系统广播
	def send_broadcast(subject, content)
		message = PzzMessage.new(
			message_subject: subject, 
			message_content: content,
			message_folder: 0, 
			message_type: PzzMessage.message_types[:broadcast], 
			message_status: 0
			)

		if message.save?
			return 200
		else
			return 500
		end
	end

	# 发送系统消息 
	def send_system_message(to_user, subject, content)
		message = PzzMessage.new(
			message_subject: subject, 
			message_content: content,
			message_folder: 0, 
			message_type: PzzMessage.message_types[:system], 
			message_status: 0,
			to_user_id: to_user.id
			)

		if message.save?
			return 200
		else
			return 500
		end


	end

end
