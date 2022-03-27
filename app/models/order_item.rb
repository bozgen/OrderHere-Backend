class OrderItem < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true

    after_initialize :set_status

    belongs_to :shop
    belongs_to :table


    
    private

    STATUSES = {
        not_delivered: 0,
        delivered: 1,
    }
    def set_status
        self.status = STATUSES[:not_delivered] if self.new_record?
    end
end
