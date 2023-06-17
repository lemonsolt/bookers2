class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  def index
    @user = current_user.id
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def book_params
    params.require(:book).permit(:user_id,:title,:body,)
  end
end
