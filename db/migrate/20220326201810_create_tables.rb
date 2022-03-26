class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.string :table_no
      t.integer :status
      t.string :owner_id
      
      t.belongs_to :shop

      t.timestamps
    end
  end
end
