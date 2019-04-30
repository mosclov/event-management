class AddColumnsToProspects < ActiveRecord::Migration[5.2]
  def change
    add_column :prospects, :start_time, :datetime
    add_column :prospects, :end_time, :datetime
    add_column :prospects, :description, :string
  end
end
