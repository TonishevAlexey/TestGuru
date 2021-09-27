class User < ApplicationRecord
  has_many :user_tests
  has_many :test, through: :user_tests
  has_many :tests_author, class_name: 'Test'
  validates :name, presence: true

  def test_level(level)
    test.where(level: level)
  end
end
