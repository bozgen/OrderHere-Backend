class User < ApplicationRecord
    tokenizable

    after_initialize :default_values

    validates :username,            presence: true, uniqueness: true
    validates :email,               presence: true, uniqueness: true
    validates :encrypted_password,  presence: true

    private

        def default_values
            self.role ||= ROLES[:waiter]
        end

        ROLES = {
        waiter: 0,  # admin
        owner: 1    # superadmin
        }
end
