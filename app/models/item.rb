class Item < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true

    belongs_to :shop
    belongs_to :item_type


    def name_to_lowercase
        params[:name] = params[:name].downcase
    end
end
