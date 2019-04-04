class AddEventToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :event, foreign_key: true
  end
end
