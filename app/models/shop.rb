class Shop < ApplicationRecord
    validates :name, presence: true
    validates :shop_type_id, presence: true
    before_save :set_url

    has_many :items

    def shop_name
        self.name.capitalize
    end
end
