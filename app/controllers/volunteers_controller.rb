class VolunteersController < ApplicationController

    layout false

    def index
        #
    end

    def show
        @volunteer = Volunteer.find(params[:id]);
    end

    def new
        #
    end

    def create
        # for testing: render plain: params[:volunteer].inspect

        @volunteer = Volunteer.new(volunteer_params);

        @volunteer.save;

        redirect_to @volunteer;

    end


    private

    def volunteer_params
        params.require(:volunteer).permit(:first_name, 
            :last_name,:email_address, :notes);
    end



end
