class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :session_token, null: false
      t.string :password, null: false
      t.timestamps
    end
    add_index :users, :email_address, unique: true
    add_index :users, :session_token
  end
end
