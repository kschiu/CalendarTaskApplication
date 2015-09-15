class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :status
      t.string :htmlLink
      t.string :summary
      t.string :description
      t.date :startDate
      t.datetime :startDateTime
      t.string :startTimeZone
      t.date :endDate
      t.datetime :endDateTime
      t.string :endTimeZone
      t.boolean :endTimeUnspecified
      t.string :recurrence
      t.int :calendar_id

      t.timestamps
    end
  end
end
