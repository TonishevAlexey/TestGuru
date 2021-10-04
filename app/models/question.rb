class Question < ApplicationRecord
  has_many :answers
  belongs_to :test
  validates :title, presence: true
end
