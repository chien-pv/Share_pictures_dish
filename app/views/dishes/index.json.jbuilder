json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :image, :desc, :processing, :food_id, :day_id, :category_id, :address
  json.url dish_url(dish, format: :json)
end
