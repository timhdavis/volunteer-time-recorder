class Event < ApplicationRecord
    has_many :time_records, :dependent => :delete_all

    # Other methods:

    def event_title
        return (self.name.to_s + " (" + self.year.to_s + ")");
    end

end
