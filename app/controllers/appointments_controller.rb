class AppointmentsController < ApplicationController
    
    before_action :redirect_not_logged_in
    
    def new
        @appointment = Appointment.new
    end

    def create
        buster = get_buster
        @appt = Appointment.new(time: parse_time, address: appt_params['address'], user_id: current_user.id, ghostbuster_id: buster.id)
        if @appt.save
            Ghost.create(ghost_params)
        redirect_to appointment_path(@appt)
        else
            render "appointments#new"
        end
    end

    def show
        @appt = Appointment.find(params[:id])
        @ghost = current_user.ghosts.last
    end

    private

    def appt_params
        params.require(:appointment).permit(:time, :address, ghost: [:name, :rating])
    end

    def ghost_params
        new_ghost = appt_params[:ghost]
        {user_id: current_user.id, name: new_ghost['name'], rating: new_ghost['rating']}
    end

    def get_buster
        buster = Ghostbuster.all.find {|buster| buster.appointments.last.time.hour > parse_time.hour + 3}
        if buster.nil?
            flash[:message] = "There are no Ghostbusters available for that time.  Please reschedule for after #{Appointment.all.last.time.strftime('%b %e, %l:%M %p')}"
        else
        buster
        end
    end
end
