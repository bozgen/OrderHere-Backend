class RemoveEncyptedTokenFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_token, :string
  end
end
