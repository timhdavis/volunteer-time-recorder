class VolunteersController < ApplicationController

    def index
        # Get all volunteer records from the database to display:

        if params[:member_type]
          @member_type_filter = MemberType.find_by_id(params[:member_type]);
        end

        if params[:search]
          @search_filter = params[:search].to_s;
        end

        # Check if a 'search' parameter was passed in:
        @volunteers = Volunteer.search(params[:search]).of_member_type(params[:member_type]).sorted.page(params[:page]).per(10);
        # if params[:search]
        #     @volunteers = Volunteer.search(params[:search]).sorted.page(params[:page]).per(10); #paginate(:page => params[:page], :per_page => 10);
        # else
        #     @volunteers = Volunteer.sorted.page(params[:page]).per(10); #paginate(:page => params[:page], :per_page => 10);
        # end
    end

    def show
        # Get the volunteer object that was selected:
        @volunteer = Volunteer.find(params[:id]);

        # Get the associated member type:
        @member_type = MemberType.find_by_id(@volunteer.member_type_id);

        @total_hours = total_time_for_all_time_records(@volunteer.time_records);
        #@total_hours_text = total_hours.to_s + " hours";

        @quota_hours = @member_type.quota_hours;

        percent = (@total_hours / @quota_hours) * 100;
        @progress_percent = percent.round(1).to_s;
    end

    # Called when rendering the New Volunteer page:
    def new
        # Check if can create a Volunteer yet:
        # Check if there are any MemberTypes yet:
        if MemberType.count < 1
          render 'warn_cannot_add'
        end

        # Create a new volunteer instance that will be used in the form:
        @volunteer = Volunteer.new;

        # Get all member type records for the form selection:
        @member_types = MemberType.all;
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

        # Get all member type records for the form selection:
        @member_types = MemberType.all;
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
            :last_name,:email_address, :phone, :notes, :member_type_id);
    end

    def total_time_for_all_time_records(time_records)
        sum = 0;

        time_records.each do |time_record|
            sum += time_record.total_hours;
        end

        return sum;
    end


end
