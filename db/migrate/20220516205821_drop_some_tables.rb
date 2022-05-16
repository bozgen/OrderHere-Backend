class DropSomeTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :users
    drop_table :jwt_denylists
    drop_table :admins
  end
end
