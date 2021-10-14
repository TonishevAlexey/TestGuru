class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_admin!
    unless current_user.admin?
      render inline: "<h2>Для доступа к странице авторизуйтесь под учетной записью Администратора</h2> <%= link_to 'Вернуться к тестам', tests_path %>", status: 401
    end
  end
end
