class PzzComment < ActiveRecord::Base

	# fields
	enum comment_approved: [:yes, :no]
	# yes 已通过
	# no 未通过

	# validates


	#relationships
	has_many :pzz_comment_metas, dependent: :destroy
	belongs_to :pzz_post
	# self join
  	has_many :subordinates, class_name: "PzzComment",
                          foreign_key: "comment_parent_id"
  	belongs_to :comment_parent, class_name: "PzzComment" 
end
