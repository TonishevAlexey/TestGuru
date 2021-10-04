module TestsHelper
  def test_header(question)
    if question.new_record?
      "Создать новый  тест #{@test.title}"
    else
      "Измененть тест #{@test.title}"
    end
  end
end