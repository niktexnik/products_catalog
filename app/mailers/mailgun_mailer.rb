class MailgunMailer < ApplicationMailer
  def send_verify_code(email, code)
    @code = code
    mail(to: email, subject: 'Your authorization code')
  end
end
