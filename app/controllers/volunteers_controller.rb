class VolunteersController < ApplicationController

    def index
        # Get all volunteer records from the database to display:
        @volunteers = Volunteer.all;
    end

    def show
        # Get the volunteer object that was selected:
        @volunteer = Volunteer.find(params[:id]);
    end

    # Called when rendering the New Volunteer page:
    def new
        # Create a new volunteer instance that will be used in the form:
        @volunteer = Volunteer.new;
    end

    # Called when the New Volunteer form is submitted:
    def create
        # Create a new volunteer instance that will be used in the form:
        @volunteer = Volunteer.new(volunteer_params);

        if(@volunteer.save)
            # If saved to DB successfully, go to show page:
            redirect_to @volunteer;
        else
            # If validations prevented save, reload form (with error message):
            render 'new';
        end

    end

    # Called when rendering the Edit Volunteer page:
    def edit
        # Get the volunteer object that was selected:
        @volunteer = Volunteer.find(params[:id]);
    end

    # Called when the Edit Volunteer form is submitted:
    def update
        # Get the volunteer object that was selected:
        @volunteer = Volunteer.find(params[:id]);

        if(@volunteer.update(volunteer_params))
            # If saved to DB successfully, go to show page:
            redirect_to @volunteer;
        else
            # If validations prevented save, reload form (with error message):
            render 'edit';
        end
    end


    private

    # Defines the acceptable fields for Volunteer:
    def volunteer_params
        params.require(:volunteer).permit(:first_name, 
            :last_name,:email_address, :notes);
    end



end
