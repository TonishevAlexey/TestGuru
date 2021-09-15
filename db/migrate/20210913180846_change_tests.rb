class ChangeTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :published_at
    remove_column :questions, :body
    remove_column :answers, :title
    remove_column :users, :test
  end
end
