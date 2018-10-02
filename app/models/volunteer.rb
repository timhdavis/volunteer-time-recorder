class Volunteer < ApplicationRecord

    has_many :time_records, :dependent => :delete_all

    # Attributes: first_name, last_name, email_address, notes

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, presence: true

    # Scopes:

    scope :newest_first, lambda { order("created_at DESC") }
    scope :sorted, lambda { order("first_name ASC") }
    scope :search, lambda { |query| where(["first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%"]) }

end
