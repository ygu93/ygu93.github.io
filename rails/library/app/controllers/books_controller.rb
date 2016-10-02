class BooksController < ApplicationController
  def index
    # your code here
    @books= Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
    Book.create(book_params)
    redirect_to action: "index"
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    book.destroy
    redirect_to action: "index"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
