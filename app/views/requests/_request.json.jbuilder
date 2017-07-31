json.extract! request, :id, :creditor_id, :debtor_id, :line_item_name, :amount, :comment, :acknowledged_request_status, :created_at, :updated_at
json.url request_url(request, format: :json)
