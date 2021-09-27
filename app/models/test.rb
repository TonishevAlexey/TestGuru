class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :user, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.tests_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
