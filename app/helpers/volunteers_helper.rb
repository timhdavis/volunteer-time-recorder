module VolunteersHelper

    def full_name(volunteer)
        return (volunteer.first_name.to_s + " " + volunteer.last_name.to_s);
    end

    def full_name_with_email(volunteer)
        return (volunteer.first_name.to_s + " " + volunteer.last_name.to_s + " <" + volunteer.email_address + ">");
    end

end
