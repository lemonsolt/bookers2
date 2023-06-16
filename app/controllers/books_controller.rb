class BooksController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
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
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:name,:body)
  end
end
