class MemberType < ApplicationRecord

    validates :name, presence: true
    validates :quota_hours, presence: true

end
