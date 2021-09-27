class Answer < ApplicationRecord
  scope :right, -> { where(correct: true) }
  belongs_to :question
  validates :body, presence: true
  validate :validate_number_of_answers

  private

  def validate_number_of_answers
    errors.add(:answers, 'Very many answers') if question.answers.count >= 4
  end
end
