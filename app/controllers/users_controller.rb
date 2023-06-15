class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end
  
  def is_matching_login_user
    user =User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end
