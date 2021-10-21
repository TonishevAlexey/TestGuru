class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(Test.find(params[:id]))
    redirect_to current_user.test_passage(Test.find(params[:id]))
  end
end
