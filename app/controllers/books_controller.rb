class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  
  def index
      @books = Book.all;
  end
  
  def new
    @book = Book.new
  end
  
  def create
      @book = Book.new(book_params)

      if @book.save
        # 成功
        redirect_to books_path, notice: "新增書本成功!"
      else
        # 失敗
        render :new
      end
   end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      # 成功
      redirect_to books_path, notice: "update"
    else
      # 失敗
      render 'edit'
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path, notice: "deleted!"
  end
  
  private
  def book_params
    params.require("book").permit(:title, :introduction, :author, :price)
  end
  
  def find_book
    @book = Book.find_by(id: params[ :id])
    redirect_to books_path, notice: "no data!" if @book.nil?
  end
end
