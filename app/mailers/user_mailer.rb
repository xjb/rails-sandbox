class UserMailer < ApplicationMailer
  default to: 'notifications@example.com'

  def sign_up
    mail subject: "[#{self.class.name}] #{__method__}"
  end
end
