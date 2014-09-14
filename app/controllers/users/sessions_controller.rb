class Users::SessionsController < Devise::SessionsController
	# def create 
	# 	self.resource = warden.authenticate!(auth_options)
 	# 	  set_flash_message(:notice, :signed_in) if is_flashing_format?
	#     sign_in(resource_name, resource)
	#     yield resource if block_given?
	#     respond_to do |format|
	#     	format.json{ render json: resource }
	    	
	#     	format.html{ redirect_to after_sign_in_path_for(resource) }
	#     end
	# end
end