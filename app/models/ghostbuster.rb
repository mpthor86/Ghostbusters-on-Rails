class Ghostbuster < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    validates :name, presence: true, uniqueness: true
    validates :years_experience, length: {minimum: 2}

    def self.get_buster
        #where("time > ?", time)
        self.joins(:appointments).where.not("time > ?", Time.now)
    end
end
