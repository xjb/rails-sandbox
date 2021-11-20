# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # delegate :sign_up, to: :UserMailer

  def sign_up
    UserMailer.sign_up
  end
end
