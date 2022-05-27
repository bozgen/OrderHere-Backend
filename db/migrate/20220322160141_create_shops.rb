class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :picture_url
      t.string :shop_key

      t.belongs_to :shop_type

      t.timestamps
    end
  end
end
