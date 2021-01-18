class Ghostbuster < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    has_many :ghosts
end
