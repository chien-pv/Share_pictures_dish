class HomeController < ApplicationController
  def index
    @dishh = Dish.last(8)
  end
end
