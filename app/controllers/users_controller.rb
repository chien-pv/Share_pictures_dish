class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users= User.all
    @users=@users.paginate(:page => params[:page], :per_page  => 5)
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_index_path, notice: 'User was successfully destroyed.' }
    end
  end

  def show
  end
  def new
   @users= User.new
  end
  def edit
  end
  def update
    # binding.pry
    respond_to do |format|
      if User.xu_ly_edit(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def create
    @users = User.Them(user_params)
    # binding.pry
    respond_to do |format|
      if @users.save
        format.html { redirect_to users_index_path, notice: 'user was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def set_user
      @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:id, :name, :email, :role_id, :password)
  end
  
end
