class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :set_locale
  before_filter :devise_parameter_sanitizer, if: :devise_controller?


  def set_current_user
      PzzUser.current = current_pzz_user
  end

  # localization
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {locale: I18n.locale}
  end

  # cancan exception handle
  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to main_app.root_url, :alert => exception.message
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  # devise parameter sanitizer(strong parameters)
  protected
  def devise_parameter_sanitizer
  	if resource_class == PzzUser
  		PzzUser::ParameterSanitizer.new(PzzUser, :pzz_user, params)
  	else
  		super
  	end	
  end

  def after_sign_in_path_for(resource)
       if resource.is_a?(PzzUser)
         if PzzUser.count == 1
           resource.add_role 'admin'
         end
         resource
       end
       root_path
  end


  # after sign out back to http, if using ssl
  def after_sign_out_path_for(resource_or_scope)
    root_url(:protocol => 'http')
  end

  def http_authenticate
      authenticate_or_request_with_http_digest do |login, password|
        login == "foo" && password == "bar"
      end
      warden.custom_failure! if performed?
    end

end
