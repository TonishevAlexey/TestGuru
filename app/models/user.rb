class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test'
  validates :name, presence: true

  def test_level(level)
    test.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
