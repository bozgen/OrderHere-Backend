class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :encrypted_token
      t.boolean :role

      t.timestamps
    end
  end
end
