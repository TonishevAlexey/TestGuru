class AddCountAndPublishedToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :published, :string
    add_column :test_passages, :attempt, :integer, default: 0
    add_column :test_passages, :success, :boolean, default: false

  end
end
