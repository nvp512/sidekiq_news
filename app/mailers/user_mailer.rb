class UserMailer < ApplicationMailer
  default from: "noreply@bit-trading.online"

  def welcome_email user
   @user = user
   @url  = 'http://example.com/login'
   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
 end
end
