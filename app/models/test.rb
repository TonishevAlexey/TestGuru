class Test < ApplicationRecord
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title) }

  belongs_to :category
  has_many :user_tests
  has_many :user, through: :user_tests

  validates :body, :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  validates_uniqueness_of :title, scope: :level

end
