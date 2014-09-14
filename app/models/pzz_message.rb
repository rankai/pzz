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

end
