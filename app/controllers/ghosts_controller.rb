class GhostsController < ApplicationController
    def show
        @ghost = Ghost.find(params[:id])
    end

    def index
        if params[:user_id]
            @ghost = current_user.ghosts
        else
        @ghost = Ghost.all
        end
    end

    def edit
        @ghost = Ghost.find(params[:id])
    end

    def update
        @ghost = Ghost.find(params[:id])
        @ghost.update(ghost_params)
        redirect_to user_ghost_path(@ghost)
    end

    def destroy
        Ghost.destroy(params[:id])
        redirect_to user_ghosts_path(current_user)
    end

    private

    def ghost_params
        params.require(:ghost).permit(:name, :rating, :user_id, :id)
    end
end
