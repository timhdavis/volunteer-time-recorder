class TimeRecord < ApplicationRecord
  belongs_to :event
  belongs_to :volunteer

  # Other methods:

  def total_hours
    return TimeDifference.between(self.start_time, self.end_time).in_hours;
  end

  
end
