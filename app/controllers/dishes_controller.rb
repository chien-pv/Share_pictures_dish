class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
    @dishes=@dishes.paginate(:page => params[:page], :per_page  => 5)
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    # binding.pry
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
          params[:dish][:id].each do |fa|
          unless fa.blank? or fa.nil?
            DishsDay.create(day_id: fa, dish_id: @dish.id)
          end
        end
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :image, :desc, :processing, :food_id, :id, :category_id, :address)
    end
end
