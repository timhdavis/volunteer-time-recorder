class Volunteer < ApplicationRecord
    # Attributes: first_name, last_name, email_address, notes

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, presence: true
end
