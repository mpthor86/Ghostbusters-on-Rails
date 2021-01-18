class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def redirect_not_logged_in
        redirect_to '/signin' if !logged_in?
    end
end
