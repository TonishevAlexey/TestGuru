class Badge < ApplicationRecord

  has_many :badge_user
  has_many :users, through: :badge_user

  validates :title, presence: true, uniqueness: true
  validates :image, presence: true
  validates :kind, presence: true, uniqueness: true

  def kind_text
    if kind == '0'
      "Уровень"
    elsif kind == '1'
      "Первый проход"
    elsif kind == '2'
      "Все категории"

    end
  end

end

