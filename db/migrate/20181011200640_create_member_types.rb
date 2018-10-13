class CreateMemberTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :member_types do |t|
      t.string :name
      t.text :details
      t.integer :quota_hours

      t.timestamps
    end
  end
end
