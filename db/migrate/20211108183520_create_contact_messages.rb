class CreateContactMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text, null: false
      t.text :email, null: false
      t.timestamps
    end
  end
end
