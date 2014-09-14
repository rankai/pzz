class HomeController < ApplicationController
  def index
  	user = PzzUser.first
  	p "#{user.user_status_i18n}"
  	p "#{t("enums.pzz_user.user_status.active")}"
  end
end
