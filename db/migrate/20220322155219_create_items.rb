class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :quantity
      t.belongs_to :shop
      t.belongs_to :item_type

      t.timestamps
    end
  end
end
