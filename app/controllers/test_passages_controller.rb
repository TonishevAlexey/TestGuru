class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist ]
  before_action :authenticate_user!

  def show
  end

  def result
    if @test_passage.attempt == 1 && @test_passage.success == true && Badge.find_by(kind: 1) != nil
      current_user.badge.push(Badge.find_by(kind: 1))
      @badge = Badge.find_by(kind: 1)

    elsif Test.tests_level(@test_passage.test.level).count == current_user.tests.tests_level(@test_passage.test.level).count && current_user.tests.tests_level(@test_passage.test.level).count != nil && Badge.find_by(kind: 0) != nil
      current_user.badge.push(Badge.find_by(kind: 0))
      @badge = Badge.find_by(kind: 0)

    elsif Test.tests_category(@test_passage.test.category.title).count == current_user.tests.tests_category(@test_passage.test.category.title).where(test_passages: { success: true }).count && current_user.tests.tests_category(@test_passage.test.category.title).where(test_passages: { success: true }).count != nil && Badge.find_by(kind: 2) != nil
      current_user.badge.push(Badge.find_by(kind: 2))
      @badge = Badge.find_by(kind: 2)
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    @test_passage.next_question

    if @test_passage.completed_test?
      @test_passage.success_test
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
