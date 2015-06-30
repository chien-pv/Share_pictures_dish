class CommendsController < ApplicationController
    def create
    # binding.pry
    @post = Dish.find(params[:dish_id])
    @comment = @post.commends.create(user_id: current_user.id, comment: comment_params[:comment])
    redirect_to dish_path(@post)
  end

  def destroy
    @post = Dish.find(params[:dish_id])
    @comment = Commend.find(params[:id])
    @comment.destroy
    redirect_to @post
  end 

  private
  def comment_params
    params.require(:commend).permit(:user_id, :comment)
  end
end
