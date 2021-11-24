class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.(\w|[a-z]){2,3}\z/i

  has_many :badge_user, dependent: :nullify
  has_many :badge, through: :badge_user
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :contact_messages
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL }

  def test_level(level)
    test.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.type == 'Admin'
  end
end
