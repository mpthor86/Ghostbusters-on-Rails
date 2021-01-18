class AppointmentsController < ApplicationController
    def new
        @appointment = Appointment.new
    end

    def create
        byebug
    end

    private

    def appt_params
        params.require(:appointment).permit(:time, :user_id, :ghostbuster_id)
    end
end
