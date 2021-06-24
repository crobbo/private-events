class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_column :event_registrations, :event_id, :integer
    add_column :event_registrations, :attendee_id, :integer
  end
end
