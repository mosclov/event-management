class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :type
      t.date :date
      t.string :location
      t.integer :pax
      t.string :contact
      t.string :attended_by

      t.timestamps
    end
  end
end
