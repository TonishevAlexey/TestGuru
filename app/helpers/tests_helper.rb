module TestsHelper
  def test_header(question)
    if question.new_record?
      "#{t('admin.tests.new.header')}"
    else
      "#{t('admin.tests.edit.header')} #{@test.title}"
    end
  end
end