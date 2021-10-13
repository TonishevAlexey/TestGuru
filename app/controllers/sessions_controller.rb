class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:requested_url] || root_path
    else
      flash.now[:alert] = 'Неправильный логин или пароль'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to tests_path
  end

end
