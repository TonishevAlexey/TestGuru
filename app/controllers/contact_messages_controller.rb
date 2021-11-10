class ContactMessagesController < ApplicationController
  def new

  end

  def create
    @contact_message = current_user.contact_messages.new(contact_message_params)
    if @contact_message.save
      UserMailer.with(contact_message: @contact_message).contact_email.deliver_now
      redirect_to root_path, notice: "Никто это не читает."
    else
      render :new
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:email, :text)
  end
end