class Badge < ApplicationRecord

  has_many :badge_user
  has_many :users, through: :badge_user

  validates :title, presence: true, uniqueness: true
  validates :image, presence: true
  validates :kind, presence: true, uniqueness: true

end

