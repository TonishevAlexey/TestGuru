class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :gists, dependent: :destroy
  validates :title, presence: true
end
