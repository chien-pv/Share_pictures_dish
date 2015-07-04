class DishesController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
   redirect_to root_url, :alert => exception.message
  end 

  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
    @dishes=@dishes.paginate(:page => params[:page], :per_page  => 5)
  end

  def list_dish
  if params[:q].blank?&&params[:category_id].blank?
    @dishes = Dish.all
  elsif params[:category_id].blank?   
     @dishes = Dish.where("name LIKE '%#{params[:q]}%'")
  else
    @dishes = Dish.where("category_id = '#{params[:category_id]}'")
  end
  @dishes=@dishes.paginate(:page => params[:page], :per_page  => 12)
  end
  def show_comment
    @dish = Dish.find(params[:dish_id])
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end
  def post_dish
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
        format.html { redirect_to dishes_url, notice: 'Dish was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def create_post
    # binding.pry
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
          params[:dish][:id].each do |fa|
          unless fa.blank? or fa.nil?
            DishsDay.create(day_id: fa, dish_id: @dish.id)
          end
        end
        format.html { redirect_to dish_show_comment_path(@dish.id), notice: 'Dish was successfully created.' }
      else
        format.html { render :post_dish }
      end
    end
  end
  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to dishes_url, notice: 'Dish was successfully updated.' }
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
      # binding.pry
      params.require(:dish).permit(:name, :image, :desc, :processing, :food_id, :id, :category_id, :address)
    end
end
