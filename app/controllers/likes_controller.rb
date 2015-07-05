class LikesController < ApplicationController
    def like
    if Like.find_by(like: 1, user_id: params[:like_id], dish_id: params[:dish_id]).nil?
    Like.create(like: 1, user_id: params[:like_id], dish_id: params[:dish_id])
    respond_to do |format|
    # format.html { redirect_to dish_show_comment_path(@dish.id) }
    format.js
    end

    end
  end
end
