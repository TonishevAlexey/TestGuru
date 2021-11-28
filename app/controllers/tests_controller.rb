class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    tests = current_user.tests

    tests.push(@test) unless tests.exists?(params[:id])

    current_user.test_passage(@test).start

    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
