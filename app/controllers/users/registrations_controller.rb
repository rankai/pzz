class PzzUser::RegistrationsController < Devise::RegistrationsController

	# old for story-up
	# def if_user_exist?
	# 	respond_to do |format|
	# 		@user = User.find_by(username: params[:username])
	# 		if @user.nil?
	# 			format.json { head :no_content}
	# 		else
	# 			format.json { head :not_acceptable}
	# 		end
	# 	end
	# end

	api :GET, "/phone_registered", "Test if a phone is registered"
	param :user_phone
	def phone_registered?
		respond_to do |format|
			user = PzzUser.find_by(user_phone: params[:user_phone])
			if user.nil?
				format.json { head :no_content }
			else
				format.json { head :not_acceptable}
			end
		end
	end

	api :Get, "/email_registered", "Test if an email is registered"
	param :email
	def email_registered?
		respond_to do |format|
			user = PzzUser.find_by(email: params[:email])
			if user.nil?
				format.json { head :no_content }
			else
				format.json { head :not_acceptable}
			end
		end
	end
end