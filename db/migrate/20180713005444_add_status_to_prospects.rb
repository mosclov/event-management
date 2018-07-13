class AddStatusToProspects < ActiveRecord::Migration[5.2]
  def change
    add_column :prospects, :status, :string, default: "Seguimiento"
  end
end
