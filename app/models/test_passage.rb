class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_save :before_save_next_question, unless: :new_record?
  TEST_COMPLETED = 85

  def accept!(answer_ids)
    answer_ids = answer_ids.reject { |c| c.empty? }
    if correct_answer?(answer_ids)
      self.current_questions += 1
    end
    save!
  end

  def completed_test?
    current_question.nil?
  end

  def completed?
    interest >= TEST_COMPLETED
  end

  def interest
    current_questions.to_i * 100.0 / test.questions.count
  end

  def questions_count
    test.questions.count
  end

  def question_now
    test.questions.order(id: :asc).to_a.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(id: :asc).first if test.present?
  end

  def before_save_next_question
    self.current_question = test.questions.where('id > ?', current_question).first
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right
  end
end
