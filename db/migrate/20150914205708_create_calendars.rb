class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :year, default: '2015'
      t.string :month, default: '9'
      t.string :day, default: '16'

      t.timestamps
    end
  end
end
