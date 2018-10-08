module EventsHelper

    def event_title(event)
        return (event.name.to_s + " (" + event.year.to_s + ")");
    end

end
