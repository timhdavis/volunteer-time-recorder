class AddPhoneToVolunteer < ActiveRecord::Migration[5.1]
  def change
    add_column :volunteers, :phone, :string
  end
end
