class CreateProspects < ActiveRecord::Migration[5.2]
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :type
      t.date :prospect_date
      t.string :location
      t.integer :pax

      t.timestamps
    end
  end
end
