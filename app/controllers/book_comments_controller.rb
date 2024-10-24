class BookCommentsController < ApplicationController
    
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end
  
  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    #urlに含まれるid（params[:id])と一致するidをBookCommentモデルから探してくる。かつbook_idも一致するidを探してくる（複数指定検索）
    redirect_to request.referer
    #一つ前の画面に戻る
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
    
end
