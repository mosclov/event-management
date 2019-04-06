class AddPerPaxToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :per_pax, :decimal, :precision => 8, :scale => 2
  end
end
