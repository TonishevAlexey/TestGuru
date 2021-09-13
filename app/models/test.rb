class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  def self.tests_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
