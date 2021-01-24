class User < ApplicationRecord
    has_many :appointments
    has_many :ghostbusters, through: :appointments
    has_many :ghosts
    has_secure_password

    validates :username, presence: true, length: {maximum: 25}, uniqueness: true
    validates :address, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid]) do |u|
            u.username = response[:info][:email]
            u.password = SecureRandom.hex(12)
            u.address = 'Please Update Profile'
        end
    end
end
