json.extract! payment, :id, :request_id, :amount, :acknowledged_payment_status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
