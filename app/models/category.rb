class Category < ApplicationRecord
  default_scope { order(title: :asc) }
  has_many :questions
  validates :title, presence: true

end
