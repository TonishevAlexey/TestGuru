class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_user, :logged_in?
  before_action :authenticate_user!

  def authenticate_admin!
    redirect_to root_path, alert: t('.message') unless current_user.admin?
  end

  def default_url_options
    I18n.locale != I18n.default_locale ? { lang: I18n.locale } : {}
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def logged_in?
    current_user.present?
  end
end
