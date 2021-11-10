class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def contact_email
    @contact_message = params[:contact_message]
    mail(to: ENV['ADMIN_EMAIL'], from: @contact_message.email, subject: @contact_message.text)
  end
end
