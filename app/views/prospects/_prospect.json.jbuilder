json.extract! prospect, :id, :name, :phone, :email, :type, :prospect_date, :location, :pax, :created_at, :updated_at
json.url prospect_url(prospect, format: :json)
