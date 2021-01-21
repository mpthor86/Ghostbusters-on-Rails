class Ghostbuster < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    validates :name, presence: true, uniqueness: true
    validates :years_experience, length: {minimum: 2}

    
end
