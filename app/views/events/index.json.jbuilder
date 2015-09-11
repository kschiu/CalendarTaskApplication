json.array!(@events) do |event|
  json.extract! event, :id, :status, :htmlLink, :summary, :description, :startDate, :startDateTime, :startTimeZone, :endDate, :endDateTime, :endTimeZone, :endTimeUnspecified, :recurrence
  json.url event_url(event, format: :json)
end
