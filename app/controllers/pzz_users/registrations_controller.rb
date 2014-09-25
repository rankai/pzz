class PzzUsers::RegistrationsController < Devise::RegistrationsController

	before_filter :authenticate_user_from_token!

	# make for public api and native website
	wrap_parameters :pzz_user, 
		include: [:email, :password, :password_confirmation, 
			:user_nickname, :user_avatar, :user_phone,  
			:user_description, :user_status, 
			:user_display_name, :user_age, :user_contact_prefer, :user_qq]

	def create

		respond_to do |format|  
		format.html { 
		  super 
		}
		format.json {
		  build_resource(sign_up_params)
		  if resource.save
		     render :status => 200, :json => resource
		  else
		    render :json => resource.errors, :status => :unprocessable_entity
		  end
		}
		end
 	end

	def update
		@resource = PzzUser.find(current_pzz_user.id)

		successfully_updated = if needs_password?(@resource, params)
			@resource.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
		else
			# remove the virtual current_password attribute
			# update_without_password doesn't know how to ignore it
			params[:pzz_user].delete(:current_password)
			@resource.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
		end

		if successfully_updated
			set_flash_message :notice, :updated
			# Sign in the user bypassing validation in case their password changed
			sign_in @resource, :bypass => true
			redirect_to after_update_path_for(@resource)
		else
			render "edit"
		end
	end

  # PUT /pzz_users
  # PUT /pzz_users.json
  api :put, "/pzz_users/:id.json", "update user info with token"
  def update_with_token

    respond_to do |format|
      format.json {
        resource = PzzUser.find(params[:id])
        successfully_updated = if needs_password?(resource, params)
          resource.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
        else
          # remove the virtual current_password attribute
          # update_without_password doesn't know how to ignore it
          params[:pzz_user].delete(:current_password)
          resource.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
        end

        if successfully_updated
          head :ok
        else
          head :unauthroized
        end
      }
    end
    
  end

	private

	# check if we need password to update user data
	# ie if password or email was changed
	# extend this as needed
	def needs_password?(user, params)
		#user.email != params[:pzz_user][:email] ||
		params[:pzz_user][:email].present? ||
		params[:pzz_user][:password].present? ||
		params[:pzz_user][:password_confirmation].present?
	end


	# Signs in a user on sign up. You can overwrite this method in your own
	# RegistrationsController.
	def sign_up(resource_name, resource)
	  	sign_in(resource_name, resource)
	end

	protected

	def after_sign_up_path_for(resource)
	   #"register_success"
	   super
	end

	def after_inactive_sign_up_path_for(resource)
       #'mail_active'
       super
  	end

  	public 

  	api :GET, "pzz_users/phone_registered", "Test if a phone is registered"
	# param :user_phone
	def phone_registered
		respond_to do |format|
			format.json {
				user = PzzUser.find_by(user_phone: params[:user_phone])
				if user.nil?
					head :no_content
				else
					head :not_acceptable
				end
			}
		end
	end

	api :GET, "pzz_users/email_registered", "Test if an email is registered"
	# param :email
	def email_registered
		respond_to do |format|
			format.json {
				user = PzzUser.find_by(email: params[:email])
				if user.nil?
					head :no_content
				else
					head :not_acceptable
				end
			}
		end
	end
 
end