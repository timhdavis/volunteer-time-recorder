class AddMemberTypeToVolunteers < ActiveRecord::Migration[5.1]
  def change
    add_reference :volunteers, :member_type, foreign_key: true
  end
end
