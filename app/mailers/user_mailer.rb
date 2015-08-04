class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def user_email(user)
  	@user = user
  	@url = "http://localhost.com:3000/users/sign_up"
  	mail(to: @user.email, subject: 'Welcome to Sponsi')
  end
end
