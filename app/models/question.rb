class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :gists
  validates :title, presence: true
end
