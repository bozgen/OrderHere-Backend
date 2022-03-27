class OrderItem < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true

    belongs_to :shop
    belongs_to :table
end
