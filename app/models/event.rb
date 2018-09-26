class Event < ApplicationRecord
    has_many :time_records, :dependent => :delete_all
end
