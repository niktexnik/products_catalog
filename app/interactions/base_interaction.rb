class BaseInteraction < ActiveInteraction::Base
  def check_email(email)
    errors.add(:wrong_email, 'please check your email') if email.match(URI::MailTo::EMAIL_REGEXP).blank?
  end
end
