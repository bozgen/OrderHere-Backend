class Shop < ApplicationRecord
    validates :name, presence: true
    before_save :set_url

    def shop_name
        self.name.capitalize
    end

    private
    def set_url
        self.picture_url = "google.com"
    end
end
