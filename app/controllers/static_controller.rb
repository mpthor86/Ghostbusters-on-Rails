class StaticController < ApplicationController
    def home
    end

    def error
        render_404
    end
end
