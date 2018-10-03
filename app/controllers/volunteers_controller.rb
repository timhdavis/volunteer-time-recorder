class VolunteersController < ApplicationController

    def index
        # Get all volunteer records from the database to display:

        # Check if a 'search' parameter was passed in:
        if params[:search]
            @volunteers = Volunteer.search(params[:search]).sorted.paginate(:page => params[:page], :per_page => 10);
        else
            @volunteers = Volunteer.sorted.paginate(:page => params[:page], :per_page => 10);
        end
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
            # Present a 1-time flash message to the user after redirect:
            flash[:notice] = "Volunteer created successfully.";

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
            # Present a 1-time flash message to the user after redirect:
            flash[:notice] = "Volunteer updated successfully.";

            # If saved to DB successfully, go to show page:
            redirect_to @volunteer;
        else
            # If validations prevented save, reload form (with error message):
            render 'edit';
        end
    end


    def delete
        @volunteer = Volunteer.find(params[:id]);
    end

    def destroy
        @volunteer = Volunteer.find(params[:id]);

        @volunteer.destroy;

        # Present a 1-time flash message to the user after redirect:
        flash[:notice] = "Volunteer '#{@volunteer.first_name} #{@volunteer.last_name}' deleted successfully.";

        redirect_to(volunteers_path);
    end

    private

    # Defines the acceptable fields for Volunteer:
    def volunteer_params
        params.require(:volunteer).permit(:first_name, 
            :last_name,:email_address, :phone, :notes);
    end



end
