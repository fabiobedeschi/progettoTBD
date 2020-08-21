class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]

  def index
    @books = Book.all.order created_at: :desc
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # Show book just added
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      # Show book just edited
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to books_path if @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :plot, :dop)
  end

  def find_book
    @book = Book.find params[:id]
  end
end
