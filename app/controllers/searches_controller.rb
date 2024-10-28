class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    #選択したモデルによって検索を実行"user"と"userでない"book"の場合
    if @model == "user"
      @records = User.search_for(@content, @method)
      #userモデルに定義したself.search_forメソッドを呼び出す。それをrecordに代入する
    else
      @records = Book.search_for(@content, @method)
    end
  end
  
end
