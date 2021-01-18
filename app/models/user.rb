class User < ApplicationRecord
    has_many :appointments
    has_many :ghostbusters, through: :appointments

    has_secure_password

    validates :username, presence: true, length: {maximum: 10}, uniqueness: true
    validates :password, presence: true, length: {minimum: 6}
    validates :address, presence: true
end
