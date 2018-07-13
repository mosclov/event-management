class RenameTypeToEventType < ActiveRecord::Migration[5.2]
  def change
    rename_column :prospects, :type, :event_type
  end
end
