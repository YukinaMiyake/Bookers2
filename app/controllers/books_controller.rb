class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
    flash[:notice] = "You have created book successfully."
  end
  
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.find(params[:id])
    @book = Book.new
    @books = Book.find(params[:id])
  end
  
  def edit 
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
      flash[:notice] = "You have updated book successfully."
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    
  end  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
