class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    tests = current_user.tests
    if tests.exists?(params[:id])
    else
      tests.push(Test.find(params[:id]))
    end
    current_user.test_passage(Test.find(params[:id])).start

    # binding.pry
    redirect_to current_user.test_passage(Test.find(params[:id]))
  end
end
