json.extract! table, :id, :name, :capacity, :description, :created_at, :updated_at
json.url table_url(table, format: :json)