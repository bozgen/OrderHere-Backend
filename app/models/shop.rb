class Shop < ApplicationRecord
    validates :name, presence: true
    validates :shop_type_id, presence: true
    before_save :set_url

    belongs_to :shop_type
    has_many :items
    has_many :tables
    has_many :order_items, through => :tables;
    has_many :requests, through => :tables;
end
