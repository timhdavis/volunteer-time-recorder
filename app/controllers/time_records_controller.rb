class TimeRecordsController < ApplicationController
    def index
        # Get all time_record records from the database to display:
        @time_records = TimeRecord.all;
    end

    def show
        # Get the time_record object that was selected:
        @time_record = TimeRecord.find(params[:id]);

        # Get the associated event:
        event_id = @time_record.event_id;

        puts("Event ID found in time_record: " + event_id.to_s);

        @event = Event.find(event_id);

        puts("Event OBJECT found in time_record: " + @event.name);

        # Get the associated event:
        volunteer_id = @time_record.volunteer_id;

        puts("Volunteer ID found in time_record: " + volunteer_id.to_s);

        @volunteer = Volunteer.find(volunteer_id);

        puts("Volunteer OBJECT found in time_record: " + @volunteer.email_address);
    end

    # Called when rendering the New TimeRecord page:
    def new
        # Create a new time_record instance that will be used in the form:
        @time_record = TimeRecord.new;

        # Get all volunteer and event records for the form selection:
        @volunteers = Volunteer.all;
        @events = Event.all;
    end

    # Called when the New TimeRecord form is submitted:
    def create
        # Create a new time_record instance that will be used in the form:
        @time_record = TimeRecord.new(time_record_params);

        # TODO : FIX to set to actual id from form:
        # @time_record.event = Event.find(:event_id.to_i);
        # @time_record.volunteer = Volunteer.find(:volunteer_id.to_i);

        if(@time_record.save)
            # Present a 1-time flash message to the user after redirect:
            flash[:notice] = "Time Record created successfully.";

            # If saved to DB successfully, go to show page:
            redirect_to @time_record;
        else
            # If validations prtime_recorded save, reload form (with error message):
            render 'new';
        end
    end

    # Called when rendering the Edit TimeRecord page:
    def edit
        # Get the time_record object that was selected:
        @time_record = TimeRecord.find(params[:id]);

        # Get all volunteer and event records for the form selection:
        @volunteers = Volunteer.all;
        @events = Event.all;
    end

    # Called when the Edit TimeRecord form is submitted:
    def update
        # Get the time_record object that was selected:
        @time_record = TimeRecord.find(params[:id]);

        if(@time_record.update(time_record_params))
            # Present a 1-time flash message to the user after redirect:
            flash[:notice] = "Time Record updated successfully.";

            # If saved to DB successfully, go to show page:
            redirect_to @time_record;
        else
            # If validations prtime_recorded save, reload form (with error message):
            render 'edit';
        end
    end


    def delete
        @time_record = TimeRecord.find(params[:id]);
    end

    def destroy
        @time_record = TimeRecord.find(params[:id]);

        @time_record.destroy;

        # Present a 1-time flash message to the user after redirect:
        flash[:notice] = "Time Record '#{@time_record.name}' deleted successfully.";

        redirect_to(time_records_path);
    end

    private

    # Defines the acceptable fields for time_record:
    def time_record_params
        params.require(:time_record).permit(:start_time, 
            :end_time, :name, :category, :notes, :event_id, :volunteer_id);
    end
end
