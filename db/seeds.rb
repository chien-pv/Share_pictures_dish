seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
# binding.pry
Role.create(config["roles_list"])
User.create(config["user_list"])
Category.create!(config["category_list"])
Food.create!(config["food_list"])
Day.create!(config["day_list"])
params_post = config["dish_list"]
@url="/public/uploads/dish/image/"
# params_post["user_id"] = User.all.sample
params_post.each do |pp|
      pp["user_id"] = User.all.sample.id
      pp["food_id"] = Food.all.sample.id
      pp["category_id"]= Category.all.sample.id
      pp["image"]= File.open(File.join(Rails.root, @url+pp["image"]))
  end
Dish.create!(params_post)
# binding.pry
# binding.pry
# dish_day_list = [
#   [Dish.all.sample.id, Day.all.sample.id],
#   [Dish.all.sample.id, Day.all.sample.id]
# ]
# dish_day_list.each do |dishid, dayid|
DishsDay.create(config["dish_day_list"])
            # dish_id: dishid,
            # day_id: dayid
    # )
# end
params_command = config["commend_list"]
params_command.each do |pm|
  pm["user_id"] = User.all.sample.id
  pm["dish_id"] = Dish.all.sample.id
end
Commend.create(params_command)
