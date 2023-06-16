class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(current_user.id)
    else
      render :show
    end
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
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:Introduction,:image)
  end
  
  def book_params
    params.require(:book).permit(:name,:body)
  end

  def is_matching_login_user
    user =User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
end
