class Test < ApplicationRecord
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_category, -> (category) { joins(:category).where(categories: { title: category }) }

  belongs_to :category
  has_many :user_tests
  has_many :user, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :body, :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  def self.tests_category(category)
    tests_category(category).order(title: :desc).pluck(:title)
  end
end
