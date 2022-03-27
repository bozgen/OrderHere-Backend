class Request < ApplicationRecord
    validates :purpose, presence: true

    belongs_to :shop
    belongs_to :table
end
