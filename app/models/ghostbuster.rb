class Ghostbuster < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    validates :name, presence: true, uniqueness: true
    validates :years_experience, length: {minimum: 2}

    def self.get_buster(time)
        self.all.each do |b|
            where("#{b.appointments.last.time} < ?", time)
        end
    end
end
