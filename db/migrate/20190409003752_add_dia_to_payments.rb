class AddDiaToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :dia, :date
  end
end
