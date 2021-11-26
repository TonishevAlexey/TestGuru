class Admin::TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy, :update_inline]
  before_action :find_tests, only: [:index, :update_inline]
  before_action :authenticate_admin!

  def index

  end

  def new
    @test = Test.new
  end
  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end
  def create
    @test = current_user.tests_author.new(test_params)
    if @test.save
      redirect_to admin_test_url(@test)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_url(@test)
      flash[:success] = "Тест успешно сохранен"
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private
  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :body, :level, :category_id)
  end

end
