class Book < ApplicationRecord
 belongs_to :user
 
  def index
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  def edit 
    @book = Book.find(paramas[:id])
  end
end
