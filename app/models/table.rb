class Table < ApplicationRecord
    validates :table_no, presence: true
    validates :status, presence: true
    
    belongs_to :shop
    has_many :requests
    has_many :order_items
    
    private

    STATUSES = {
        available: 0,
        claimed: 1,
        reserved: 2
    }
    # STATUS[:reserved] => 2
end
