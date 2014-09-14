class PzzMailer < ActionMailer::Base
  default from: "rankai@mointe.cn"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pzz_mailer.inform.subject
  #
  def inform
    @greeting = "Hi"

    mail to: "378774043@qq.com"
  end

  # def feedback_mail(user, subject, content)
  #   @user = user
  #   @url = 'http://www.itabeya.jp'
  #   @content = content
  #   mail(from: @user.email, subject: subject)
  # end
end
