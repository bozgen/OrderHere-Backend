class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, , :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :rememberable, :timeoutable

  validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }

  def generate_jwt
    JWT.encode({ id: id, exp: 2.days.from_now.to_i },
              Rails.application.secrets.secret_key_base)
  end    
end
