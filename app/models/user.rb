class User < ApplicationRecord
    tokenizable

    validates :username,            presence: true, :unique => true
    validates :email,               presence: true, :unique => true
    validates :encrypted_password,  presence: true
    validates :role,                presence: true, :default => ROLES[:waiter]
    #Ex:- :default =>''


    private

        ROLES = {
            waiter: 0,  # admin
            owner: 1    # superadmin
        }
end
