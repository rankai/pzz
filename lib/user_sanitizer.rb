class PzzUser::ParameterSanitizer < Devise::ParameterSanitizer

	def sign_in
		default_params.permit(:login, :email, :user_phone, :password, :remember_me)
	end


	def sign_up
		default_params.permit(:user_nickname, :user_avatar, :user_phone,  
			:email, :password, :password_confirmation, :user_description, :user_status, 
			:user_display_name, :user_age, :user_contact_prefer, :user_qq)
	end

	def account_update
		default_params.permit(:id, :user_nickname, :user_avatar, :user_phone,  
			:email, :password, :password_confirmation, :user_description, :user_status, 
			:user_display_name, :user_age, :user_contact_prefer, :user_qq)
	end
end
