class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :prospects, :atendido, :attended_by
  end
end
