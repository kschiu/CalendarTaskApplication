json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :year, :month, :day
  json.url calendar_url(calendar, format: :json)
end
