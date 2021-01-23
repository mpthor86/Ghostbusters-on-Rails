class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :ghostbuster

    def time_avail
        self.time + 3.hours
    end
    
end
