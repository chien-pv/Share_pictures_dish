json.array!(@foods) do |food|
  json.extract! food, :id, :food_name
  json.url food_url(food, format: :json)
end
