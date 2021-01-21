module AppointmentsHelper
    def parse_time
        year = appt_params['time(1i)'].to_i
        month = appt_params['time(2i)'].to_i
        day = appt_params['time(3i)'].to_i
        hour = appt_params['time(4i)'].to_i
        min = appt_params['time(5i)'].to_i
        
        time = DateTime.new(year,month,day,hour,min,0)
        
    end

    
end
