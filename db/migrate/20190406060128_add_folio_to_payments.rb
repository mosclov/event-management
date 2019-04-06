class AddFolioToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :folio, :string
  end
end
