class UserssController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private

end
