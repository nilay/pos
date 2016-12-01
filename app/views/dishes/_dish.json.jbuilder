json.extract! dish, :id, :category, :name, :description, :price, :published, :created_at, :updated_at
json.url dish_url(dish, format: :json)