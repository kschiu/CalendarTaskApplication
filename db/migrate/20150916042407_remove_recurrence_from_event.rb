class RemoveRecurrenceFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :recurrence
  end
end
