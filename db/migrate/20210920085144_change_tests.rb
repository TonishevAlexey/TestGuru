class ChangeTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author
  end
end
