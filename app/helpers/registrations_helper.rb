module RegistrationsHelper
  def resource_name
    :pzz_user
  end

  def resource
    @resource ||= PzzUser.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:pzz_user]
  end
end