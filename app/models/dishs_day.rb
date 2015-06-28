class DishsDay < ActiveRecord::Base
  belongs_to :dish
  belongs_to :day
end
