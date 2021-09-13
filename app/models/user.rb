class User < ApplicationRecord
  has_many :test
  def test_level(level)
    test.where("level == ?", level)
  end
end
