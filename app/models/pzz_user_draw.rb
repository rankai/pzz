class PzzUserDraw < ActiveRecord::Base

	# fields


	# validates


	# relationships
	belongs_to :pzz_user
	belongs_to :pzz_draw_config
end
