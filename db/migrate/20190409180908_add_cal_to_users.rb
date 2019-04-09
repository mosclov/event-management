class AddCalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cal, :boolean, default: false
  end
end
