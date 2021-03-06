class Admin::QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
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
    if @question.update(question_params)
      redirect_to admin_question_url(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_url(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title)
  end

  def rescue_with_record_not_found
    render plain: "Вопрос не найден"
  end
end