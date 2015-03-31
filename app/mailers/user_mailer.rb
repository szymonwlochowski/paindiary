class UserMailer < ActionMailer::Base
  default from: 'elo@paindiary.com'

  def welcome_email(user)
    @user = user
    @url = 'http://paindiary.dev:3000'
    mail(to: @user.email, subject: 'Welcome to Pain Diary')
  end
end
