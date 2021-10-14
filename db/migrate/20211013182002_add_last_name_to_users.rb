class AddLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :type, :string, default: 'User'
    add_index :users,:type
  end
end
