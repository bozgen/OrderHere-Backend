class AddBelongsToShopToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.belongs_to :shop, foreign_key: true
    end
  end
end
