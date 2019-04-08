json.extract! payment, :id, :event_id, :amount, :folio, :created_at, :updated_at
json.url payment_url(payment, format: :json)
