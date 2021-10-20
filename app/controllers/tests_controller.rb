class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end
end
