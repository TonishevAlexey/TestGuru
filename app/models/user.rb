class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.(\w|[a-z]){2,3}\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test'
  validates :name, :email, presence: true
  validates :password, presence: true, if: proc { |u| u.password_digest.blank? }
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL}
  has_secure_password

  def test_level(level)
    test.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
