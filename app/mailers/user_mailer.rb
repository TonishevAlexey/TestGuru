class UserMailer < ApplicationMailer

  def contact_email
    @contact_message = params[:contact_message]
    mail(to: ENV['ADMIN_EMAIL'], from: @contact_message.email, text: @contact_message.text)
  end
end
