class BadgesController < ApplicationController

  def index
    @badges = current_user.badge
  end

end
