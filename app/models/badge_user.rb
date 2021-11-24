class BadgeUser < ApplicationRecord
  self.table_name = 'badges_users'

  belongs_to :user
  belongs_to :badge
end

