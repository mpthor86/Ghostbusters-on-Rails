module GhostbustersHelper
    def get_buster
        buster = Ghostbuster.all.find {|buster| buster.appointments.last.time < parse_time + 2.hours}
        #if buster.nil?
        #    flash[:message] = "There are no Ghostbusters available for that time.  Please reschedule for after #{Appointment.all.last.time.strftime('%b %e, %l:%M %p')}"
        #else
        buster
        #end
    end
end
