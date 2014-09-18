class HomeController < ApplicationController
  def index
  	user = PzzUser.first
  	#p "#{user.user_status_i18n}"
  	p "#{t("enums.pzz_user.user_status.active")}"

  	if pzz_user_signed_in?
  		# remember to include template to g the content
  		p "#{current_pzz_user.email}"
  		PzzSms.send_sms(current_pzz_user,"18612696688", "test sdf fsdl: sd")
  	end
  end
end
