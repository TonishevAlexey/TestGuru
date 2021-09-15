class ChangeTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :body
    remove_column :answers, :title
    remove_column :users, :test
    add_column :tests, :body, :string
  end
end
