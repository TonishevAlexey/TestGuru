class ContactMessage < ApplicationRecord
  belongs_to :user
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.(\w|[a-z]){2,3}\z/i

  validates :text, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL }

end
