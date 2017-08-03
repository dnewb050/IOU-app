class AddActivationTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation_token, :string
    add_index :users, :activation_token, unique: true
  end
end
