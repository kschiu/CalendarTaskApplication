class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :event_id
      t.string :name
      t.text :description
      t.date :end_date
      t.time :end_time
      t.boolean :is_complete

      t.timestamps
    end
  end
end
