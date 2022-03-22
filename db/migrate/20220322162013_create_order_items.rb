class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :owner_id

      t.belongs_to :shop, :table

      t.timestamps
    end
  end
end
