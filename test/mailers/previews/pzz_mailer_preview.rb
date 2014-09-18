# Preview all emails at http://localhost:3000/rails/mailers/pzz_mailer
class PzzMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pzz_mailer/inform
  def inform
    PzzMailer.inform
  end

end
