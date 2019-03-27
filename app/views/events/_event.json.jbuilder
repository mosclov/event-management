json.extract! event, :id, :name, :phone, :email, :type, :date, :location, :pax, :contact, :attended_by, :created_at, :updated_at
json.url event_url(event, format: :json)
