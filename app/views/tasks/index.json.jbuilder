json.array!(@tasks) do |task|
  json.extract! task, :id, :event_id, :name, :description, :is_complete, :end_date, :end_time
  json.url task_url(task, format: :json)
end
