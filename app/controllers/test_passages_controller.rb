class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist ]
  before_action :authenticate_user!

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed_test?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist = GistQuestionService.new(@test_passage.current_question)
    result = gist.call
    if gist.create? && current_user.gists.create(question_id: @test_passage.current_question.id, url: result.git_pull_url)
      flash[:success] = t('.created')
    else
      flash[:notice] = t('.error')
    end
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
