class ContactMessage < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
  validates :email, presence: true, format: { with: /@/ }

end
