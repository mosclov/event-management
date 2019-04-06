class AddTotalToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :total, :decimal, :precision => 8, :scale => 2
  end
end
