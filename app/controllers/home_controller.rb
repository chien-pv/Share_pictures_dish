class HomeController < ApplicationController
  def index
    @dishh = Dish.last(8)
    @sang = Day.find_by_day_name("sang")
    @chieu = Day.find_by_day_name("chieu")
    @khuya = Day.find_by_day_name("khuya")
    @dishs = Dish.joins(:dishs_days).where("dishs_days.day_id= '#{@sang.id}' or dishs_days.day_id= '#{@chieu.id}' or dishs_days.day_id= '#{@khuya.id}'").last(8)
  end
end
