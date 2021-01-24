class AppointmentsController < ApplicationController
    
    before_action :redirect_not_logged_in
    
    def new
        @appointment = Appointment.new
        @busters = Ghostbuster.get_buster(Time.now).map {|b| b.name}
    end

    def create
        buster = Ghostbuster.find_by_name(params[:appointment]['ghostbuster'])
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
        params.require(:appointment).permit(:time, :address, :ghostbuster, ghost: [:name, :rating])
    end

    def ghost_params
        new_ghost = appt_params[:ghost]
        {user_id: current_user.id, name: new_ghost['name'], rating: new_ghost['rating']}
    end
    
end
