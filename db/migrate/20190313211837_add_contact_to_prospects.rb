class AddContactToProspects < ActiveRecord::Migration[5.2]
  def change
    add_column :prospects, :contact, :string
  end
end
