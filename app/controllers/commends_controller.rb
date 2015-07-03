class CommendsController < ApplicationController
  def create
    # binding.pry
    @dish = Dish.find(params[:dish_id])
    @comment = @dish.commends.create(user_id: current_user.id, comment: comment_params[:comment])
    # redirect_to dish_show_comment_path(@post.id)
    # flash[:notice] = "Thank you for reviewing this product"
    respond_to do |format|
    format.js
    # binding.pry
    end
  end

  def destroy
    # binding.pry

    @dish = Dish.find(params[:dish_id])
    @comment = Commend.find(params[:id])
    respond_to do |format|
      # format.html { redirect_to dish_show_comment_path(@dish.id) }
      format.js
    end
    @comment.destroy 
    
  end 

  private
  def comment_params
    params.require(:commend).permit(:user_id, :comment)
  end
end
