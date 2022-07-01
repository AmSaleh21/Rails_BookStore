class BooksController < ApplicationController

  before_action :authenticate_user! , only: [:new,:edit,:destroy]


  def index
    @books = Book.all 
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      UserMailer..with(id:current_user.id).post_created.de
      redirect_to @book, notice: "book created successfuly"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "book updated successfuly"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def book_params
    params.require(:book).permit(:isbn, :name, :description, :image_url)
  end


end
