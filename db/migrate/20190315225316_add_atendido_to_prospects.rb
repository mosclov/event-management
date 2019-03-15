class AddAtendidoToProspects < ActiveRecord::Migration[5.2]
  def change
    add_column :prospects, :atendido, :string
  end
end
