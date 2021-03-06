class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :event, foreign_key: true
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :folio

      t.timestamps
    end
  end
end
