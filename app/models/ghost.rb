class Ghost < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: {maximum: 15} 

    def find_buster
        appt = self.user.appointments.find{|a| a.created_at.strftime('%H:%M:%S') == self.created_at.strftime('%H:%M:%S')}
        appt.ghostbuster.name
    end
    
end
