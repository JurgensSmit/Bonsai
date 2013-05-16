class Notifier < ActionMailer::Base
  default :from => 'no-reply@example.com',
         :return_path => 'system@example.com'

    def welcome_email(user)
        @user = user
        @url  = "http://example.com/login"
        mail(:to => user.email, :subject => "Welcome to My Awesome Site")
      end
      
	def new_message(message)
		@message = message
		mail(:subject => "[Codetry.org] #{message.subject}")
	end
end