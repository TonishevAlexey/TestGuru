module QistsHelper
  def question_title(title)
    title.truncate(25)
  end
end