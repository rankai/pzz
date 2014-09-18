class PzzPost < ActiveRecord::Base

	# fields
	enum ping_status: [:pingback_open, :pingback_closed]
	# open 开放
	# closed 关闭

	enum comment_status: [:comment_open, :comment_closed]
	# open 开放
	# closed 关闭

	enum post_status: [:publish, :draft]
	# publish 已发布
	# draft 草稿

	# validates


	# relationships
	has_many :pzz_post_metas
	has_many :pzz_comments
	belongs_to :pzz_user
end
