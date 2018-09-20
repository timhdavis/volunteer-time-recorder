class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :year
      t.text :description
      t.string :website

      t.timestamps
    end
  end
end
