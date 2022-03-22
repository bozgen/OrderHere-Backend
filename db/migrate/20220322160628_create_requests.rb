class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :purpose
      
      t.belongs_to :shop
      t.belongs_to :table

      t.timestamps
    end
  end
end
