# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def user_mail_preview
		UserMailer.user_email(User.first)
	end

	def confirmation_instructions
	  MyMailer.confirmation_instructions(User.first, "faketoken", {})
	end

	def reset_password_instructions
	  MyMailer.reset_password_instructions(User.first, "faketoken", {})
	end

	def unlock_instructions
	  MyMailer.unlock_instructions(User.first, "faketoken", {})
	end
end

