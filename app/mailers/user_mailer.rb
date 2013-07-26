class UserMailer < ActionMailer::Base
  #I like this way more actually
  #default from: ["password-reset",ENV['DOMAIN']].join('@')
  default from: "password-reset@#{ENV['DOMAIN']}"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end
end
