class BooksController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def index
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
end
