json.extract! address, :id, :street, :city, :zip, :state, :full_address, :address_pin, :created_at, :updated_at
json.url address_url(address, format: :json)
