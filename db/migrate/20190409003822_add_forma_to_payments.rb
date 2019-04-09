class AddFormaToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :forma, :string
  end
end
