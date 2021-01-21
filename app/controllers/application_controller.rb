class ApplicationController < ActionController::Base
    include ApplicationHelper
    include AppointmentsHelper
    include GhostbustersHelper
    include GhostsHelper
    private

    def redirect_not_logged_in
        redirect_to '/signin' if !logged_in?
    end

    def valid_user
        redirect_to user_path(current_user) if params[:id].to_i != session[:user_id]
    end
end
