class GistQuestionService
  attr_reader :client
  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(:access_token => ENV['GIST_ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def create?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.title', test_title: @test.title ),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end