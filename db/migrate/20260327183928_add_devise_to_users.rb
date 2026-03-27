class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
    ## Database authenticatable
    add_column :users, :encrypted_password, :string, default: "", null: false

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Indexes
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

    ## ❗ УДАЛЯЕМ старое поле
    remove_column :users, :password_digest, :string
  end
end
