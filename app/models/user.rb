class User < ApplicationRecord
    tokenizable
    has_secure_password

    after_initialize :default_values

    validates :username,            presence: true, uniqueness: true
    validates :email,               presence: true, uniqueness: true
    validates :password_digest,     presence: true

    private

        def default_values
            self.role ||= ROLES[:waiter]
        end

        ROLES = {
        waiter: 0,  # admin
        owner: 1    # superadmin
        }
end
