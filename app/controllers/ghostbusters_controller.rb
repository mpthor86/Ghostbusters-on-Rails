class GhostbustersController < ApplicationController
    def index
        @busters = Ghostbuster.all
    end

    def show
        @buster = Ghostbuster.find(params[:id])
    end
end
