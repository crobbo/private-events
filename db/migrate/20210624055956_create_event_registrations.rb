class CreateEventRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_registrations do |t|

      t.timestamps
    end
  end
end
